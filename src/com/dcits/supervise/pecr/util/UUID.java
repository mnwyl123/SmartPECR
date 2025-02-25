package com.dcits.supervise.pecr.util;
import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

public final class UUID
  implements Serializable, Comparable<UUID>
{
  private static final long serialVersionUID = -1185015143654744140L;
  private final long mostSigBits;
  private final long leastSigBits;

  private UUID(byte[] data)
  {
    long msb = 0L;
    long lsb = 0L;
    assert (data.length == 16) : "data must be 16 bytes in length";
    for (int i = 0; i < 8; i++) {
      msb = msb << 8 | data[i] & 0xFF;
    }
    for (int i = 8; i < 16; i++) {
      lsb = lsb << 8 | data[i] & 0xFF;
    }
    this.mostSigBits = msb;
    this.leastSigBits = lsb;
  }

  public UUID(long mostSigBits, long leastSigBits)
  {
    this.mostSigBits = mostSigBits;
    this.leastSigBits = leastSigBits;
  }

  public static UUID fastUUID()
  {
    return randomUUID(false);
  }

  public static UUID randomUUID()
  {
    return randomUUID(true);
  }

  public static ThreadLocalRandom getRandom()
  {
    return ThreadLocalRandom.current();
  }
  
  public static UUID randomUUID(boolean isSecure)
  {
    Random ng = isSecure ? Holder.numberGenerator : getRandom();

    byte[] randomBytes = new byte[16];
    ng.nextBytes(randomBytes);
    byte[] tmp27_24 = randomBytes; tmp27_24[6] = (byte)(tmp27_24[6] & 0xF);
    byte[] tmp37_34 = randomBytes; tmp37_34[6] = (byte)(tmp37_34[6] | 0x40);
    byte[] tmp47_44 = randomBytes; tmp47_44[8] = (byte)(tmp47_44[8] & 0x3F);
    byte[] tmp57_54 = randomBytes; tmp57_54[8] = (byte)(tmp57_54[8] | 0x80);
    return new UUID(randomBytes);
  }

  public static UUID nameUUIDFromBytes(byte[] name)
  {
    MessageDigest md;
    try
    {
      md = MessageDigest.getInstance("MD5");
    } catch (NoSuchAlgorithmException nsae) {
      throw new InternalError("MD5 not supported");
    }
    byte[] md5Bytes = md.digest(name);
    byte[] tmp29_26 = md5Bytes; tmp29_26[6] = (byte)(tmp29_26[6] & 0xF);
    byte[] tmp39_36 = md5Bytes; tmp39_36[6] = (byte)(tmp39_36[6] | 0x30);
    byte[] tmp49_46 = md5Bytes; tmp49_46[8] = (byte)(tmp49_46[8] & 0x3F);
    byte[] tmp59_56 = md5Bytes; tmp59_56[8] = (byte)(tmp59_56[8] | 0x80);
    return new UUID(md5Bytes);
  }

  public static UUID fromString(String name)
  {
    String[] components = name.split("-");
    if (components.length != 5) {
      throw new IllegalArgumentException(new StringBuilder().append("Invalid UUID string: ").append(name).toString());
    }
    for (int i = 0; i < 5; i++) {
      components[i] = new StringBuilder().append("0x").append(components[i]).toString();
    }

    long mostSigBits = Long.decode(components[0]).longValue();
    mostSigBits <<= 16;
    mostSigBits |= Long.decode(components[1]).longValue();
    mostSigBits <<= 16;
    mostSigBits |= Long.decode(components[2]).longValue();

    long leastSigBits = Long.decode(components[3]).longValue();
    leastSigBits <<= 48;
    leastSigBits |= Long.decode(components[4]).longValue();

    return new UUID(mostSigBits, leastSigBits);
  }

  public long getLeastSignificantBits()
  {
    return this.leastSigBits;
  }

  public long getMostSignificantBits()
  {
    return this.mostSigBits;
  }

  public int version()
  {
    return (int)(this.mostSigBits >> 12 & 0xF);
  }

  public int variant()
  {
    return (int)(this.leastSigBits >>> (int)(64L - (this.leastSigBits >>> 62)) & this.leastSigBits >> 63);
  }

  public long timestamp()
    throws UnsupportedOperationException
  {
    checkTimeBase();
    return (this.mostSigBits & 0xFFF) << 48 | (this.mostSigBits >> 16 & 0xFFFF) << 32 | this.mostSigBits >>> 32;
  }

  public int clockSequence()
    throws UnsupportedOperationException
  {
    checkTimeBase();
    return (int)((this.leastSigBits & 0x0) >>> 48);
  }

  public long node()
    throws UnsupportedOperationException
  {
    checkTimeBase();
    return this.leastSigBits & 0xFFFFFFFF;
  }

  public String toString()
  {
    return toString(false);
  }

  public String toString(boolean isSimple)
  {
    StringBuilder builder = StrUtil.builder(isSimple ? 32 : 36);

    builder.append(digits(this.mostSigBits >> 32, 8));
    if (false == isSimple) {
      builder.append('-');
    }

    builder.append(digits(this.mostSigBits >> 16, 4));
    if (false == isSimple) {
      builder.append('-');
    }

    builder.append(digits(this.mostSigBits, 4));
    if (false == isSimple) {
      builder.append('-');
    }

    builder.append(digits(this.leastSigBits >> 48, 4));
    if (false == isSimple) {
      builder.append('-');
    }

    builder.append(digits(this.leastSigBits, 12));

    return builder.toString();
  }

  public int hashCode()
  {
    long hilo = this.mostSigBits ^ this.leastSigBits;
    return (int)(hilo >> 32) ^ (int)hilo;
  }

  public boolean equals(Object obj)
  {
    if ((null == obj) || (obj.getClass() != UUID.class)) {
      return false;
    }
    UUID id = (UUID)obj;
    return (this.mostSigBits == id.mostSigBits) && (this.leastSigBits == id.leastSigBits);
  }

  public int compareTo(UUID val)
  {
    return this.leastSigBits > val.leastSigBits ? 1 : this.leastSigBits < val.leastSigBits ? -1 : this.mostSigBits > val.mostSigBits ? 1 : this.mostSigBits < val.mostSigBits ? -1 : 0;
  }

  private static String digits(long val, int digits)
  {
    long hi = 1L << digits * 4;
    return Long.toHexString(hi | val & hi - 1L).substring(1);
  }

  private void checkTimeBase()
  {
    if (version() != 1)
      throw new UnsupportedOperationException("Not a time-based UUID");
  }

  private static class Holder
  {
    static final SecureRandom numberGenerator = getSecureRandom();
  }
  
  public static SecureRandom getSecureRandom()
  {
    try
    {
      return SecureRandom.getInstance("SHA1PRNG"); } catch (NoSuchAlgorithmException e) {
    }
    try {
		throw new Exception();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return null;
  }
}