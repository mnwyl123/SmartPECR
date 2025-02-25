package com.dcits.supervise.pecr.util;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.Closeable;
import java.io.File;
import java.io.FileFilter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.nio.file.CopyOption;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.OpenOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.jar.JarEntry;
import java.util.jar.JarFile;
import java.util.regex.Pattern;


import org.apache.log4j.Logger;

import com.dcits.supervise.pecr.exceptions.IORuntimeException;

public class FileUtil {
	private static final char UNIX_SEPARATOR = '/';
	private static final char WINDOWS_SEPARATOR = '\\';
	private static Pattern FILE_NAME_INVALID_PATTERN_WIN = Pattern.compile("[\\\\/:*?\"<>|]");
	public static final String CLASS_EXT = ".class";
	public static final String JAR_FILE_EXT = ".jar";
	public static final String JAR_PATH_EXT = ".jar!";
	public static final String PATH_FILE_PRE = "file:";
	private final static Logger logger = Logger.getLogger(FileUtil.class);
	
	public static boolean isWindows() {
		return '\\' == File.separatorChar;
	}

	public static File[] ls(String path) {
		if (path == null) {
			return null;
		}

		path = getAbsolutePath(path);

		File file = file(path);
		if (file.isDirectory()) {
			return file.listFiles();
		}
		throw new IORuntimeException(StrUtil.format("Path [{}] is not directory!", new Object[] { path }));
	}

	public static boolean isEmpty(File file) {
		if (null == file) {
			return true;
		}

		if (file.isDirectory()) {
			String[] subFiles = file.list();
			if (ArrayUtil.isEmpty(subFiles))
				return true;
		} else if (file.isFile()) {
			return file.length() <= 0L;
		}

		return false;
	}

	public static boolean isNotEmpty(File file) {
		return false == isEmpty(file);
	}

	 public static boolean isDirEmpty(final Path dirPath) {
	        try ( DirectoryStream<Path> dirStream = Files.newDirectoryStream(dirPath)) {
	            return !dirStream.iterator().hasNext();
	        }
	        catch (IOException e) {
	            throw new IORuntimeException((Throwable)e);
	        }
	    }
	 
	

	public static boolean isDirEmpty(File dir) {
		return isDirEmpty(dir.toPath());
	}

	public static List<File> loopFiles(String path, FileFilter fileFilter) {
		return loopFiles(file(path), fileFilter);
	}

	public static List<File> loopFiles(File file, FileFilter fileFilter) {
		List fileList = new ArrayList();
		if (null == file)
			return fileList;
		if (false == file.exists()) {
			return fileList;
		}

		if (file.isDirectory()) {
			File[] subFiles = file.listFiles();
			if (ArrayUtil.isNotEmpty(subFiles)) {
				for (File tmp : subFiles) {
					fileList.addAll(loopFiles(tmp, fileFilter));
				}
			}
		} else if ((null == fileFilter) || (fileFilter.accept(file))) {
			fileList.add(file);
		}

		return fileList;
	}

	public static List<File> loopFiles(String path) {
		return loopFiles(file(path));
	}

	public static List<File> loopFiles(File file) {
		return loopFiles(file, null);
	}

	public static List<String> listFileNames(String path) throws IORuntimeException {
		if (path == null) {
			return null;
		}
		List paths = new ArrayList();

		int index = path.lastIndexOf(".jar!");
		if (index == -1) {
			File[] files = ls(path);
			for (File file : files) {
				if (file.isFile())
					paths.add(file.getName());
			}
		} else {
			path = getAbsolutePath(path);
			if (false == StrUtil.endWith(path, '/')) {
				path = path + '/';
			}

			index += ".jar".length();
			JarFile jarFile = null;
			try {
				jarFile = new JarFile(path.substring(0, index));
				String subPath = path.substring(index + 2);
				for (JarEntry entry : Collections.list(jarFile.entries())) {
					String name = entry.getName();
					if (name.startsWith(subPath)) {
						String nameSuffix = StrUtil.removePrefix(name, subPath);
						if (false == StrUtil.contains(nameSuffix, '/'))
							paths.add(nameSuffix);
					}
				}
			} catch (IOException e) {
				String subPath;
				throw new IORuntimeException(StrUtil.format("Can not read file path of [{}]", new Object[] { path }),
						e);
			} finally {
				close(jarFile);
			}
		}
		return paths;
	}
	
	 public static void close(Closeable closeable)
	  {
	    if (null != closeable)
	      try {
	        closeable.close();
	      }
	      catch (Exception e)
	      {
	      }
	  }

	  public static void close(AutoCloseable closeable)
	  {
	    if (null != closeable)
	      try {
	        closeable.close();
	      }
	      catch (Exception e)
	      {
	      }
	  }

	public static File newFile(String path) {
		return new File(path);
	}

	public static File file(String path) {
		if (StrUtil.isBlank(path)) {
			throw new NullPointerException("File path is blank!");
		}
		return new File(getAbsolutePath(path));
	}

	public static File file(String parent, String path) {
		return file(new File(parent), path);
	}

	public static File file(File parent, String path) {
		if (StrUtil.isBlank(path)) {
			throw new NullPointerException("File path is blank!");
		}
		return checkSlip(parent, new File(parent, path));
	}

	public static File file(File directory, String[] names) {
		Assert.notNull(directory, "directorydirectory must not be null", new Object[0]);
		if (ArrayUtil.isEmpty(names)) {
			return directory;
		}

		File file = directory;
		for (String name : names) {
			if (null != name) {
				file = file(file, name);
			}
		}
		return file;
	}

	public static File file(String[] names) {
		if (ArrayUtil.isEmpty(names)) {
			return null;
		}

		File file = null;
		for (String name : names) {
			if (file == null)
				file = file(name);
			else {
				file = file(file, name);
			}
		}
		return file;
	}

	public static File file(URI uri) {
		if (uri == null) {
			throw new NullPointerException("File uri is null!");
		}
		return new File(uri);
	}

	public static File file(URL url) {
		return new File(URLUtil.toURI(url));
	}

	public static String getTmpDirPath() {
		return System.getProperty("java.io.tmpdir");
	}

	public static File getTmpDir() {
		return file(getTmpDirPath());
	}

	public static String getUserHomePath() {
		return System.getProperty("user.home");
	}

	public static File getUserHomeDir() {
		return file(getUserHomePath());
	}

	public static boolean exist(String path) {
		return path == null ? false : file(path).exists();
	}

	public static boolean exist(File file) {
		return file == null ? false : file.exists();
	}

	public static boolean exist(String directory, String regexp) {
		File file = new File(directory);
		if (false == file.exists()) {
			return false;
		}

		String[] fileList = file.list();
		if (fileList == null) {
			return false;
		}

		for (String fileName : fileList) {
			if (fileName.matches(regexp)) {
				return true;
			}
		}

		return false;
	}

	public static Date lastModifiedTime(File file) {
		if (!exist(file)) {
			return null;
		}

		return new Date(file.lastModified());
	}

	public static Date lastModifiedTime(String path) {
		return lastModifiedTime(new File(path));
	}

	public static long size(File file) {
		Assert.notNull(file, "file argument is null !", new Object[0]);
		if (false == file.exists()) {
			throw new IllegalArgumentException(
					StrUtil.format("File [{}] not exist !", new Object[] { file.getAbsolutePath() }));
		}

		if (file.isDirectory()) {
			long size = 0L;
			File[] subFiles = file.listFiles();
			if (ArrayUtil.isEmpty(subFiles)) {
				return 0L;
			}
			for (int i = 0; i < subFiles.length; i++) {
				size += size(subFiles[i]);
			}
			return size;
		}
		return file.length();
	}

	public static boolean newerThan(File file, File reference) {
		if ((null == reference) || (false == reference.exists())) {
			return true;
		}
		return newerThan(file, reference.lastModified());
	}

	public static boolean newerThan(File file, long timeMillis) {
		if ((null == file) || (false == file.exists())) {
			return false;
		}
		return file.lastModified() > timeMillis;
	}

	public static File touch(String fullFilePath) throws IORuntimeException {
		if (fullFilePath == null) {
			return null;
		}
		return touch(file(fullFilePath));
	}

	public static File touch(File file) throws IORuntimeException {
		if (null == file) {
			return null;
		}
		if (false == file.exists()) {
			mkParentDirs(file);
			try {
				file.createNewFile();
			} catch (Exception e) {
				throw new IORuntimeException(e);
			}
		}
		return file;
	}

	public static File touch(File parent, String path) throws IORuntimeException {
		return touch(file(parent, path));
	}

	public static File touch(String parent, String path) throws IORuntimeException {
		return touch(file(parent, path));
	}

	public static File mkParentDirs(File file) {
		File parentFile = file.getParentFile();
		if ((null != parentFile) && (false == parentFile.exists())) {
			parentFile.mkdirs();
		}
		return parentFile;
	}

	public static File mkParentDirs(String path) {
		if (path == null) {
			return null;
		}
		return mkParentDirs(file(path));
	}

	public static boolean del(String fullFileOrDirPath) throws IORuntimeException {
		return del(file(fullFileOrDirPath));
	}

	public static boolean del(File file) throws IORuntimeException {
		if ((file == null) || (false == file.exists())) {
			return false;
		}

		if (file.isDirectory())
			clean(file);
		try {
			Files.delete(file.toPath());
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
		return true;
	}

	public static boolean clean(String dirPath) throws IORuntimeException {
		return clean(file(dirPath));
	}

	public static boolean clean(File directory) throws IORuntimeException {
		if ((directory == null) || (!directory.exists()) || (false == directory.isDirectory())) {
			return true;
		}

		File[] files = directory.listFiles();
		for (File childFile : files) {
			boolean isOk = del(childFile);
			if (!isOk) {
				return false;
			}
		}
		return true;
	}

	public static File mkdir(String dirPath) {
		if (dirPath == null) {
			return null;
		}
		File dir = file(dirPath);
		return mkdir(dir);
	}

	public static File mkdir(File dir) {
		if (dir == null) {
			return null;
		}
		if (false == dir.exists()) {
			dir.mkdirs();
		}
		return dir;
	}

	public static File createTempFile(File dir) throws IORuntimeException {
		return createTempFile("hutool", null, dir, true);
	}

	public static File createTempFile(File dir, boolean isReCreat) throws IORuntimeException {
		return createTempFile("hutool", null, dir, isReCreat);
	}

	public static File createTempFile(String prefix, String suffix, File dir, boolean isReCreat)
			throws IORuntimeException {
		int exceptionsCount = 0;
		while (true)
			try {
				File file = File.createTempFile(prefix, suffix, dir).getCanonicalFile();
				if (isReCreat) {
					file.delete();
					file.createNewFile();
				}
				return file;
			} catch (IOException ioex) {
				exceptionsCount++;
				if (exceptionsCount >= 50)
					throw new IORuntimeException(ioex);
			}
	}

	public static File copyFile(String src, String dest, StandardCopyOption[] options) throws IORuntimeException {
		Assert.notBlank(src, "Source File path is blank !", new Object[0]);
		Assert.notNull(src, "Destination File path is null !", new Object[0]);
		return copyFile(Paths.get(src, new String[0]), Paths.get(dest, new String[0]), options).toFile();
	}

	public static File copyFile(File src, File dest, StandardCopyOption[] options) throws IORuntimeException {
		Assert.notNull(src, "Source File is null !", new Object[0]);
		if (false == src.exists()) {
			throw new IORuntimeException("File not exist: " + src);
		}
		Assert.notNull(dest, "Destination File or directiory is null !", new Object[0]);
		if (equals(src, dest)) {
			throw new IORuntimeException("Files '{}' and '{}' are equal", new Object[] { src, dest });
		}
		return copyFile(src.toPath(), dest.toPath(), options).toFile();
	}
    
    public static Path copyFile( Path src,  Path dest,  StandardCopyOption... options) throws IORuntimeException {
        Assert.notNull((Object)src, "Source File is null !", new Object[0]);
        Assert.notNull((Object)dest, "Destination File or directiory is null !", new Object[0]);
         Path destPath = dest.toFile().isDirectory() ? dest.resolve(src.getFileName()) : dest;
        try {
            return Files.copy(src, destPath, (CopyOption[])options);
        }
        catch (IOException e) {
            throw new IORuntimeException(e);
        }
    }

	public static File copy(String srcPath, String destPath, boolean isOverride) throws IORuntimeException {
		return copy(file(srcPath), file(destPath), isOverride);
	}

	public static File copy(File src, File dest, boolean isOverride) throws IORuntimeException {
		return FileCopier.create(src, dest).setOverride(isOverride).copy();
	}

	public static File copyContent(File src, File dest, boolean isOverride) throws IORuntimeException {
		return FileCopier.create(src, dest).setCopyContentIfDir(true).setOverride(isOverride).copy();
	}

	public static File copyFilesFromDir(File src, File dest, boolean isOverride) throws IORuntimeException {
		return FileCopier.create(src, dest).setCopyContentIfDir(true).setOnlyCopyFile(true).setOverride(isOverride)
				.copy();
	}

	public static void move(File src, File dest, boolean isOverride) throws IORuntimeException {
		if (false == src.exists()) {
			throw new IORuntimeException("File not found: " + src);
		}

		if ((src.isDirectory()) && (dest.isFile())) {
			throw new IORuntimeException(
					StrUtil.format("Can not move directory [{}] to file [{}]", new Object[] { src, dest }));
		}

		if ((isOverride) && (dest.isFile())) {
			dest.delete();
		}

		if ((src.isFile()) && (dest.isDirectory())) {
			dest = new File(dest, src.getName());
		}

		if (false == src.renameTo(dest))
			try {
				copy(src, dest, isOverride);
				src.delete();
			} catch (Exception e) {
				throw new IORuntimeException(StrUtil.format("Move [{}] to [{}] failed!", new Object[] { src, dest }),
						e);
			}
	}

	public static File rename(File file, String newName, boolean isRetainExt, boolean isOverride) {
		if (isRetainExt) {
			newName = newName.concat(".").concat(extName(file));
		}
		if(!file.exists()) {
			throw new NullPointerException("file is not exists");
		}
		Path path = file.toPath();
		CopyOption[] options = isOverride ? new CopyOption[] { StandardCopyOption.REPLACE_EXISTING }
				: new CopyOption[0];
		try {
			return Files.move(path, path.resolveSibling(newName), options).toFile();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
	}

	public static String getCanonicalPath(File file) {
		if (null == file)
			return null;
		try {
			return file.getCanonicalPath();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
	}

	public static String getAbsolutePath(String path, Class<?> baseClass) {
		String normalPath="";
		if (path == null) {
			//normalPath = "";
		} else {
//			normalPath = normalize(path);
			if (isAbsolutePath(normalPath)) {
				return normalPath;
			}
			
		}
		return null;
//		URL url = ResourceUtil.getResource(normalPath, baseClass);
//		if (null != url) {
//			return normalize(URLUtil.getDecodedPath(url));
//		}
//
//		String classPath = ClassUtil.getClassPath();
//		if (null == classPath) {
//			return path;
//		}

//		return normalize(classPath.concat(path));
	}

	public static String getAbsolutePath(String path) {
		return getAbsolutePath(path, null);
	}

	public static String getAbsolutePath(File file) {
		if (file == null) {
			return null;
		}
		try {
			return file.getCanonicalPath();
		} catch (IOException e) {
		}
		return file.getAbsolutePath();
	}

	public static boolean isAbsolutePath(String path) {
		if (StrUtil.isEmpty(path)) {
			return false;
		}

		return ('/' == path.charAt(0)) || (path.matches("^[a-zA-Z]:[/\\\\].*"));
	}

	public static boolean isDirectory(String path) {
		return path == null ? false : file(path).isDirectory();
	}

	public static boolean isDirectory(File file) {
		return file == null ? false : file.isDirectory();
	}

	public static boolean isDirectory(Path path, boolean isFollowLinks) {
		if (null == path) {
			return false;
		}
		LinkOption[] options = { (LinkOption) (isFollowLinks ? new LinkOption[0] : LinkOption.NOFOLLOW_LINKS) };
		return Files.isDirectory(path, options);
	}

	public static boolean isFile(String path) {
		return path == null ? false : file(path).isFile();
	}

	public static boolean isFile(File file) {
		return file == null ? false : file.isFile();
	}

	public static boolean isFile(Path path, boolean isFollowLinks) {
		if (null == path) {
			return false;
		}
		LinkOption[] options = { (LinkOption) (isFollowLinks ? new LinkOption[0] : LinkOption.NOFOLLOW_LINKS) };
		return Files.isRegularFile(path, options);
	}

	public static boolean equals(File file1, File file2) throws IORuntimeException {
		Assert.notNull(file1);
		Assert.notNull(file2);
//		if ((false == file1.exists()) || (false == file2.exists())) {
//			return (false == file1.exists()) && (false == file2.exists()) && (pathEquals(file1, file2));
//		}

		try {
			return Files.isSameFile(file1.toPath(), file2.toPath());
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
		
	}
	
/*	 public static File writeFromStream(InputStream in, File dest)
			    throws IORuntimeException
			  {
			    return FileWriter.create(dest).writeFromStream(in);
			  }

	  public static File writeFromStream(InputStream in, String fullFilePath)
	    throws IORuntimeException
	  {
	    return writeFromStream(in, touch(fullFilePath));
	  }*/

//	public static boolean contentEquals(File file1, File file2) throws IORuntimeException {
//		boolean file1Exists = file1.exists();
//		if (file1Exists != file2.exists()) {
//			return false;
//		}
//
//		if (false == file1Exists) {
//			return true;
//		}
//
//		if ((file1.isDirectory()) || (file2.isDirectory())) {
//			throw new IORuntimeException("Can't compare directories, only files");
//		}
//
//		if (file1.length() != file2.length()) {
//			return false;
//		}
//
//		if (equals(file1, file2)) {
//			return true;
//		}
//
//		InputStream input1 = null;
//		InputStream input2 = null;
//		try {
//			input1 = getInputStream(file1);
//			input2 = getInputStream(file2);
//			boolean bool1 = IoUtil.contentEquals(input1, input2);
//			return bool1;
//		} finally {
//			IoUtil.close(input1);
//			IoUtil.close(input2);
//		}
//		throw localObject;
//	}
//
//	public static boolean contentEqualsIgnoreEOL(File file1, File file2, Charset charset) throws IORuntimeException {
//		boolean file1Exists = file1.exists();
//		if (file1Exists != file2.exists()) {
//			return false;
//		}
//
//		if (!file1Exists) {
//			return true;
//		}
//
//		if ((file1.isDirectory()) || (file2.isDirectory())) {
//			throw new IORuntimeException("Can't compare directories, only files");
//		}
//
//		if (equals(file1, file2)) {
//			return true;
//		}
//
//		Reader input1 = null;
//		Reader input2 = null;
//		try {
//			input1 = getReader(file1, charset);
//			input2 = getReader(file2, charset);
//			boolean bool1 = IoUtil.contentEqualsIgnoreEOL(input1, input2);
//			return bool1;
//		} finally {
//			IoUtil.close(input1);
//			IoUtil.close(input2);
//		}
//		throw localObject;
//	}
//
//	public static boolean pathEquals(File file1, File file2) {
//		if (isWindows()) {
//			try {
//				if (StrUtil.equalsIgnoreCase(file1.getCanonicalPath(), file2.getCanonicalPath()))
//					return true;
//			} catch (Exception e) {
//				if (StrUtil.equalsIgnoreCase(file1.getAbsolutePath(), file2.getAbsolutePath()))
//					return true;
//			}
//		} else {
//			try {
//				if (StrUtil.equals(file1.getCanonicalPath(), file2.getCanonicalPath()))
//					return true;
//			} catch (Exception e) {
//				if (StrUtil.equals(file1.getAbsolutePath(), file2.getAbsolutePath())) {
//					return true;
//				}
//			}
//		}
//		return false;
//	}
//
//	public static int lastIndexOfSeparator(String filePath) {
//		if (StrUtil.isNotEmpty(filePath)) {
//			int i = filePath.length();
//
//			while (i-- >= 0) {
//				char c = filePath.charAt(i);
//				if (CharUtil.isFileSeparator(c)) {
//					return i;
//				}
//			}
//		}
//		return -1;
//	}
//
//	public static boolean isModifed(File file, long lastModifyTime) {
//		if ((null == file) || (false == file.exists())) {
//			return true;
//		}
//		return file.lastModified() != lastModifyTime;
//	}
//
//	public static String normalize(String path) {
//		if (path == null) {
//			return null;
//		}
//
//		String pathToUse = StrUtil.removePrefixIgnoreCase(path, "classpath:");
//
//		pathToUse = StrUtil.removePrefixIgnoreCase(pathToUse, "file:");
//
//		pathToUse = pathToUse.replaceAll("[/\\\\]{1,}", "/").trim();
//
//		int prefixIndex = pathToUse.indexOf(":");
//		String prefix = "";
//		if (prefixIndex > -1) {
//			prefix = pathToUse.substring(0, prefixIndex + 1);
//			if (StrUtil.startWith(prefix, '/')) {
//				prefix = prefix.substring(1);
//			}
//			if (false == prefix.contains("/")) {
//				pathToUse = pathToUse.substring(prefixIndex + 1);
//			} else {
//				prefix = "";
//			}
//		}
//		if (pathToUse.startsWith("/")) {
//			prefix = prefix + "/";
//			pathToUse = pathToUse.substring(1);
//		}
//
//		List pathList = StrUtil.split(pathToUse, '/');
//		List pathElements = new LinkedList();
//		int tops = 0;
//
//		for (int i = pathList.size() - 1; i >= 0; i--) {
//			String element = (String) pathList.get(i);
//			if (".".equals(element))
//				continue;
//			if ("..".equals(element)) {
//				tops++;
//			} else if (tops > 0) {
//				tops--;
//			} else {
//				pathElements.add(0, element);
//			}
//
//		}
//
//		return prefix + CollUtil.join(pathElements, "/");
//	}

//	public static String subPath(String rootDir, File file) {
//		try {
//			return subPath(rootDir, file.getCanonicalPath());
//		} catch (IOException e) {
//			throw new IORuntimeException(e);
//		}
//		
//	}

//	public static String subPath(String dirPath, String filePath) {
//		if ((StrUtil.isNotEmpty(dirPath)) && (StrUtil.isNotEmpty(filePath))) {
//			dirPath = StrUtil.removeSuffix(normalize(dirPath), "/");
//			filePath = normalize(filePath);
//
//			String result = StrUtil.removePrefixIgnoreCase(filePath, dirPath);
//			return StrUtil.removePrefix(result, "/");
//		}
//		return filePath;
//	}

	public static Path getPathEle(Path path, int index) {
		return subPath(path, index, index == -1 ? path.getNameCount() : index + 1);
	}

	public static Path getLastPathEle(Path path) {
		return getPathEle(path, path.getNameCount() - 1);
	}

	public static Path subPath(Path path, int fromIndex, int toIndex) {
		if (null == path) {
			return null;
		}
		int len = path.getNameCount();

		if (fromIndex < 0) {
			fromIndex = len + fromIndex;
			if (fromIndex < 0)
				fromIndex = 0;
		} else if (fromIndex > len) {
			fromIndex = len;
		}

		if (toIndex < 0) {
			toIndex = len + toIndex;
			if (toIndex < 0)
				toIndex = len;
		} else if (toIndex > len) {
			toIndex = len;
		}

		if (toIndex < fromIndex) {
			int tmp = fromIndex;
			fromIndex = toIndex;
			toIndex = tmp;
		}

		if (fromIndex == toIndex) {
			return null;
		}
		return path.subpath(fromIndex, toIndex);
	}

	public static String getName(File file) {
		return null != file ? file.getName() : null;
	}

	public static String getName(String filePath) {
		if (null == filePath) {
			return filePath;
		}
		int len = filePath.length();
		if (0 == len) {
			return filePath;
		}
		if (CharUtil.isFileSeparator(filePath.charAt(len - 1))) {
			len--;
		}

		int begin = 0;

		for (int i = len - 1; i > -1; i--) {
			char c = filePath.charAt(i);
			if (!CharUtil.isFileSeparator(c))
				continue;
			begin = i + 1;
			break;
		}

		return filePath.substring(begin, len);
	}

	public static String mainName(File file) {
		if (file.isDirectory()) {
			return file.getName();
		}
		return mainName(file.getName());
	}

	public static String mainName(String fileName) {
		if (null == fileName) {
			return fileName;
		}
		int len = fileName.length();
		if (0 == len) {
			return fileName;
		}
		if (CharUtil.isFileSeparator(fileName.charAt(len - 1))) {
			len--;
		}

		int begin = 0;
		int end = len;

		for (int i = len - 1; i > -1; i--) {
			char c = fileName.charAt(i);
			if ((len == end) && ('.' == c)) {
				end = i;
			}
			if (((0 != begin) && (begin <= end)) || (!CharUtil.isFileSeparator(c)))
				continue;
			begin = i + 1;
			break;
		}

		return fileName.substring(begin, end);
	}

	public static String extName(File file) {
		if (null == file) {
			return null;
		}
		if (file.isDirectory()) {
			return null;
		}
		return extName(file.getName());
	}

	public static String extName(String fileName) {
		if (fileName == null) {
			return null;
		}
		int index = fileName.lastIndexOf(".");
		if (index == -1) {
			return "";
		}
		String ext = fileName.substring(index + 1);

		return StrUtil.containsAny(ext, new char[] { '/', '\\' }) ? "" : ext;
	}

	public static boolean pathEndsWith(File file, String suffix) {
		return file.getPath().toLowerCase().endsWith(suffix);
	}

//	public static String getType(File file) throws IORuntimeException {
//		return FileTypeUtil.getType(file);
//	}
//
//	public static BasicFileAttributes getAttributes(Path path, boolean isFollowLinks) throws IORuntimeException {
//		if (null == path) {
//			return null;
//		}
//
//		LinkOption[] options = { isFollowLinks ? new LinkOption[0] : LinkOption.NOFOLLOW_LINKS };
//		try {
//			return Files.readAttributes(path, BasicFileAttributes.class, options);
//		} catch (IOException e) {
//		}
//		throw new IORuntimeException(e);
//	}
//
	public static BufferedInputStream getInputStream(Path path) throws IORuntimeException {
		InputStream is = null;
		BufferedInputStream bs = null;
		try {
			is = Files.newInputStream(path, new OpenOption[0]);
			bs = new BufferedInputStream(is);
			return bs;
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}finally {
			if(is != null) {
				try {
					is.close();
				} catch (IOException e) {
				}
			}
			if(bs != null) {
				try {
					bs.close();
				} catch (IOException e) {
				}
			}
		}
	}

	public static BufferedInputStream getInputStream(File file) throws IORuntimeException {
		return new BufferedInputStream(IoUtil.toStream(file));
	}

	public static BufferedInputStream getInputStream(String path) throws IORuntimeException {
		return getInputStream(file(path));
	}
//
//	public static BOMInputStream getBOMInputStream(File file) throws IORuntimeException {
//		try {
//			return new BOMInputStream(new FileInputStream(file));
//		} catch (IOException e) {
//		}
//		throw new IORuntimeException(e);
//	}
//
//	public static BufferedReader getUtf8Reader(Path path) throws IORuntimeException {
//		return getReader(path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static BufferedReader getUtf8Reader(File file) throws IORuntimeException {
//		return getReader(file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static BufferedReader getUtf8Reader(String path) throws IORuntimeException {
//		return getReader(path, CharsetUtil.CHARSET_UTF_8);
//	}
//
	public static BufferedReader getReader(Path path, Charset charset) throws IORuntimeException {
		return IoUtil.getReader(getInputStream(path), charset);
	}

	public static BufferedReader getReader(File file, String charsetName) throws IORuntimeException {
		return IoUtil.getReader(getInputStream(file), charsetName);
	}

	public static BufferedReader getReader(File file, Charset charset) throws IORuntimeException {
		return IoUtil.getReader(getInputStream(file), charset);
	}

	public static BufferedReader getReader(String path, String charsetName) throws IORuntimeException {
		return getReader(file(path), charsetName);
	}

	public static BufferedReader getReader(String path, Charset charset) throws IORuntimeException {
		return getReader(file(path), charset);
	}
//
//	public static byte[] readBytes(File file) throws IORuntimeException {
//		return FileReader.create(file).readBytes();
//	}
//
//	public static byte[] readBytes(String filePath) throws IORuntimeException {
//		return readBytes(file(filePath));
//	}
//
//	public static String readUtf8String(File file) throws IORuntimeException {
//		return readString(file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static String readUtf8String(String path) throws IORuntimeException {
//		return readString(path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static String readString(File file, String charsetName) throws IORuntimeException {
//		return readString(file, CharsetUtil.charset(charsetName));
//	}
//
//	public static String readString(File file, Charset charset) throws IORuntimeException {
//		return FileReader.create(file, charset).readString();
//	}
//
//	public static String readString(String path, String charsetName) throws IORuntimeException {
//		return readString(file(path), charsetName);
//	}
//
//	public static String readString(String path, Charset charset) throws IORuntimeException {
//		return readString(file(path), charset);
//	}
//
//	public static String readString(URL url, String charset) throws IORuntimeException {
//		if (url == null) {
//			throw new NullPointerException("Empty url provided!");
//		}
//
//		InputStream in = null;
//		try {
//			in = url.openStream();
//			String str = IoUtil.read(in, charset);
//			return str;
//		} catch (IOException e) {
//			throw new IORuntimeException(e);
//		} finally {
//			IoUtil.close(in);
//		}
//		throw localObject;
//	}
//
//	public static <T extends Collection<String>> T readUtf8Lines(String path, T collection) throws IORuntimeException {
//		return readLines(path, CharsetUtil.CHARSET_UTF_8, collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(String path, String charset, T collection)
//			throws IORuntimeException {
//		return readLines(file(path), charset, collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(String path, Charset charset, T collection)
//			throws IORuntimeException {
//		return readLines(file(path), charset, collection);
//	}
//
//	public static <T extends Collection<String>> T readUtf8Lines(File file, T collection) throws IORuntimeException {
//		return readLines(file, CharsetUtil.CHARSET_UTF_8, collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(File file, String charset, T collection)
//			throws IORuntimeException {
//		return FileReader.create(file, CharsetUtil.charset(charset)).readLines(collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(File file, Charset charset, T collection)
//			throws IORuntimeException {
//		return FileReader.create(file, charset).readLines(collection);
//	}
//
//	public static <T extends Collection<String>> T readUtf8Lines(URL url, T collection) throws IORuntimeException {
//		return readLines(url, CharsetUtil.CHARSET_UTF_8, collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(URL url, String charsetName, T collection)
//			throws IORuntimeException {
//		return readLines(url, CharsetUtil.charset(charsetName), collection);
//	}
//
//	public static <T extends Collection<String>> T readLines(URL url, Charset charset, T collection)
//			throws IORuntimeException {
//		InputStream in = null;
//		try {
//			in = url.openStream();
//			Collection localCollection = IoUtil.readLines(in, charset, collection);
//			return localCollection;
//		} catch (IOException e) {
//			throw new IORuntimeException(e);
//		} finally {
//			IoUtil.close(in);
//		}
//		throw localObject;
//	}
//
//	public static List<String> readUtf8Lines(URL url) throws IORuntimeException {
//		return readLines(url, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static List<String> readLines(URL url, String charset) throws IORuntimeException {
//		return (List) readLines(url, charset, new ArrayList());
//	}
//
//	public static List<String> readLines(URL url, Charset charset) throws IORuntimeException {
//		return (List) readLines(url, charset, new ArrayList());
//	}
//
//	public static List<String> readUtf8Lines(String path) throws IORuntimeException {
//		return readLines(path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static List<String> readLines(String path, String charset) throws IORuntimeException {
//		return (List) readLines(path, charset, new ArrayList());
//	}
//
//	public static List<String> readLines(String path, Charset charset) throws IORuntimeException {
//		return (List) readLines(path, charset, new ArrayList());
//	}
//
//	public static List<String> readUtf8Lines(File file) throws IORuntimeException {
//		return readLines(file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static List<String> readLines(File file, String charset) throws IORuntimeException {
//		return (List) readLines(file, charset, new ArrayList());
//	}
//
//	public static List<String> readLines(File file, Charset charset) throws IORuntimeException {
//		return (List) readLines(file, charset, new ArrayList());
//	}
//
//	public static void readUtf8Lines(File file, LineHandler lineHandler) throws IORuntimeException {
//		readLines(file, CharsetUtil.CHARSET_UTF_8, lineHandler);
//	}
//
//	public static void readLines(File file, Charset charset, LineHandler lineHandler) throws IORuntimeException {
//		FileReader.create(file, charset).readLines(lineHandler);
//	}
//
//	@Deprecated
//	public static <T> T load(FileReader.ReaderHandler<T> readerHandler, String path, String charset)
//			throws IORuntimeException {
//		return FileReader.create(file(path), CharsetUtil.charset(charset)).read(readerHandler);
//	}
//
//	public static <T> T loadUtf8(String path, FileReader.ReaderHandler<T> readerHandler) throws IORuntimeException {
//		return load(path, CharsetUtil.CHARSET_UTF_8, readerHandler);
//	}
//
//	public static <T> T load(String path, String charset, FileReader.ReaderHandler<T> readerHandler)
//			throws IORuntimeException {
//		return FileReader.create(file(path), CharsetUtil.charset(charset)).read(readerHandler);
//	}
//
//	public static <T> T load(String path, Charset charset, FileReader.ReaderHandler<T> readerHandler)
//			throws IORuntimeException {
//		return FileReader.create(file(path), charset).read(readerHandler);
//	}
//
//	public static <T> T loadUtf8(File file, FileReader.ReaderHandler<T> readerHandler) throws IORuntimeException {
//		return load(file, CharsetUtil.CHARSET_UTF_8, readerHandler);
//	}
//
//	public static <T> T load(File file, Charset charset, FileReader.ReaderHandler<T> readerHandler)
//			throws IORuntimeException {
//		return FileReader.create(file, charset).read(readerHandler);
//	}
//
//	public static BufferedOutputStream getOutputStream(File file) throws IORuntimeException {
//		try {
//			return new BufferedOutputStream(new FileOutputStream(touch(file)));
//		} catch (Exception e) {
//		}
//		throw new IORuntimeException(e);
//	}
//
//	public static BufferedOutputStream getOutputStream(String path) throws IORuntimeException {
//		return getOutputStream(touch(path));
//	}
//
//	public static BufferedWriter getWriter(String path, String charsetName, boolean isAppend)
//			throws IORuntimeException {
//		return getWriter(touch(path), Charset.forName(charsetName), isAppend);
//	}
//
//	public static BufferedWriter getWriter(String path, Charset charset, boolean isAppend) throws IORuntimeException {
//		return getWriter(touch(path), charset, isAppend);
//	}
//
//	public static BufferedWriter getWriter(File file, String charsetName, boolean isAppend) throws IORuntimeException {
//		return getWriter(file, Charset.forName(charsetName), isAppend);
//	}
//
//	public static BufferedWriter getWriter(File file, Charset charset, boolean isAppend) throws IORuntimeException {
//		return FileWriter.create(file, charset).getWriter(isAppend);
//	}
//
//	public static PrintWriter getPrintWriter(String path, String charset, boolean isAppend) throws IORuntimeException {
//		return new PrintWriter(getWriter(path, charset, isAppend));
//	}
//
//	public static PrintWriter getPrintWriter(String path, Charset charset, boolean isAppend) throws IORuntimeException {
//		return new PrintWriter(getWriter(path, charset, isAppend));
//	}
//
//	public static PrintWriter getPrintWriter(File file, String charset, boolean isAppend) throws IORuntimeException {
//		return new PrintWriter(getWriter(file, charset, isAppend));
//	}
//
//	public static String getLineSeparator() {
//		return System.lineSeparator();
//	}
//
//	public static File writeUtf8String(String content, String path) throws IORuntimeException {
//		return writeString(content, path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static File writeUtf8String(String content, File file) throws IORuntimeException {
//		return writeString(content, file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static File writeString(String content, String path, String charset) throws IORuntimeException {
//		return writeString(content, touch(path), charset);
//	}
//
//	public static File writeString(String content, String path, Charset charset) throws IORuntimeException {
//		return writeString(content, touch(path), charset);
//	}
//
//	public static File writeString(String content, File file, String charset) throws IORuntimeException {
//		return FileWriter.create(file, CharsetUtil.charset(charset)).write(content);
//	}
//
//	public static File writeString(String content, File file, Charset charset) throws IORuntimeException {
//		return FileWriter.create(file, charset).write(content);
//	}
//
//	public static File appendUtf8String(String content, String path) throws IORuntimeException {
//		return appendString(content, path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static File appendString(String content, String path, String charset) throws IORuntimeException {
//		return appendString(content, touch(path), charset);
//	}
//
//	public static File appendString(String content, String path, Charset charset) throws IORuntimeException {
//		return appendString(content, touch(path), charset);
//	}
//
//	public static File appendUtf8String(String content, File file) throws IORuntimeException {
//		return appendString(content, file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static File appendString(String content, File file, String charset) throws IORuntimeException {
//		return FileWriter.create(file, CharsetUtil.charset(charset)).append(content);
//	}
//
//	public static File appendString(String content, File file, Charset charset) throws IORuntimeException {
//		return FileWriter.create(file, charset).append(content);
//	}
//
//	public static <T> File writeUtf8Lines(Collection<T> list, String path) throws IORuntimeException {
//		return writeLines(list, path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static <T> File writeUtf8Lines(Collection<T> list, File file) throws IORuntimeException {
//		return writeLines(list, file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static <T> File writeLines(Collection<T> list, String path, String charset) throws IORuntimeException {
//		return writeLines(list, path, charset, false);
//	}
//
//	public static <T> File writeLines(Collection<T> list, String path, Charset charset) throws IORuntimeException {
//		return writeLines(list, path, charset, false);
//	}
//
//	public static <T> File writeLines(Collection<T> list, File file, String charset) throws IORuntimeException {
//		return writeLines(list, file, charset, false);
//	}
//
//	public static <T> File writeLines(Collection<T> list, File file, Charset charset) throws IORuntimeException {
//		return writeLines(list, file, charset, false);
//	}
//
//	public static <T> File appendUtf8Lines(Collection<T> list, File file) throws IORuntimeException {
//		return appendLines(list, file, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static <T> File appendUtf8Lines(Collection<T> list, String path) throws IORuntimeException {
//		return appendLines(list, path, CharsetUtil.CHARSET_UTF_8);
//	}
//
//	public static <T> File appendLines(Collection<T> list, String path, String charset) throws IORuntimeException {
//		return writeLines(list, path, charset, true);
//	}
//
//	public static <T> File appendLines(Collection<T> list, File file, String charset) throws IORuntimeException {
//		return writeLines(list, file, charset, true);
//	}
//
//	public static <T> File appendLines(Collection<T> list, String path, Charset charset) throws IORuntimeException {
//		return writeLines(list, path, charset, true);
//	}
//
//	public static <T> File appendLines(Collection<T> list, File file, Charset charset) throws IORuntimeException {
//		return writeLines(list, file, charset, true);
//	}
//
//	public static <T> File writeLines(Collection<T> list, String path, String charset, boolean isAppend)
//			throws IORuntimeException {
//		return writeLines(list, file(path), charset, isAppend);
//	}
//
//	public static <T> File writeLines(Collection<T> list, String path, Charset charset, boolean isAppend)
//			throws IORuntimeException {
//		return writeLines(list, file(path), charset, isAppend);
//	}
//
//	public static <T> File writeLines(Collection<T> list, File file, String charset, boolean isAppend)
//			throws IORuntimeException {
//		return FileWriter.create(file, CharsetUtil.charset(charset)).writeLines(list, isAppend);
//	}
//
//	public static <T> File writeLines(Collection<T> list, File file, Charset charset, boolean isAppend)
//			throws IORuntimeException {
//		return FileWriter.create(file, charset).writeLines(list, isAppend);
//	}
//
//	public static File writeUtf8Map(Map<?, ?> map, File file, String kvSeparator, boolean isAppend)
//			throws IORuntimeException {
//		return FileWriter.create(file, CharsetUtil.CHARSET_UTF_8).writeMap(map, kvSeparator, isAppend);
//	}
//
//	public static File writeMap(Map<?, ?> map, File file, Charset charset, String kvSeparator, boolean isAppend)
//			throws IORuntimeException {
//		return FileWriter.create(file, charset).writeMap(map, kvSeparator, isAppend);
//	}
//
//	public static File writeBytes(byte[] data, String path) throws IORuntimeException {
//		return writeBytes(data, touch(path));
//	}
//
//	public static File writeBytes(byte[] data, File dest) throws IORuntimeException {
//		return writeBytes(data, dest, 0, data.length, false);
//	}
//
//	public static File writeBytes(byte[] data, File dest, int off, int len, boolean isAppend)
//			throws IORuntimeException {
//		return FileWriter.create(dest).write(data, off, len, isAppend);
//	}
//
//	public static File writeFromStream(InputStream in, File dest) throws IORuntimeException {
//		return FileWriter.create(dest).writeFromStream(in);
//	}
//
//	public static File writeFromStream(InputStream in, String fullFilePath) throws IORuntimeException {
//		return writeFromStream(in, touch(fullFilePath));
//	}
//
//	public static File writeToStream(File file, OutputStream out) throws IORuntimeException {
//		return FileReader.create(file).writeToStream(out);
//	}
//
//	public static void writeToStream(String fullFilePath, OutputStream out) throws IORuntimeException {
//		writeToStream(touch(fullFilePath), out);
//	}
//
//	public static String readableFileSize(File file) {
//		return readableFileSize(file.length());
//	}
//
//	public static String readableFileSize(long size) {
//		if (size <= 0L) {
//			return "0";
//		}
//		String[] units = { "B", "kB", "MB", "GB", "TB", "EB" };
//		int digitGroups = (int) (Math.log10(size) / Math.log10(1024.0D));
//		return new DecimalFormat("#,##0.##").format(size / Math.pow(1024.0D, digitGroups)) + " " + units[digitGroups];
//	}
//
//	public static File convertCharset(File file, Charset srcCharset, Charset destCharset) {
//		return CharsetUtil.convert(file, srcCharset, destCharset);
//	}
//
//	public static File convertLineSeparator(File file, Charset charset, LineSeparator lineSeparator) {
//		List lines = readLines(file, charset);
//		return FileWriter.create(file, charset).writeLines(lines, lineSeparator, false);
//	}
//
//	public static String cleanInvalid(String fileName) {
//		return StrUtil.isBlank(fileName) ? fileName : ReUtil.delAll(FILE_NAME_INVALID_PATTERN_WIN, fileName);
//	}
//
//	public static boolean containsInvalid(String fileName) {
//		return StrUtil.isBlank(fileName) ? false : ReUtil.contains(FILE_NAME_INVALID_PATTERN_WIN, fileName);
//	}
//
//	public static long checksumCRC32(File file) throws IORuntimeException {
//		return checksum(file, new CRC32()).getValue();
//	}
//
//	public static Checksum checksum(File file, Checksum checksum) throws IORuntimeException {
//		Assert.notNull(file, "File is null !", new Object[0]);
//		if (file.isDirectory())
//			throw new IllegalArgumentException("Checksums can't be computed on directories");
//		try {
//			return IoUtil.checksum(new FileInputStream(file), checksum);
//		} catch (FileNotFoundException e) {
//		}
//		throw new IORuntimeException(e);
//	}
//
//	public static File getWebRoot() {
//		String classPath = ClassUtil.getClassPath();
//		if (StrUtil.isNotBlank(classPath)) {
//			return getParent(file(classPath), 2);
//		}
//		return null;
//	}

	public static String getParent(String filePath, int level) {
		File parent = getParent(file(filePath), level);
		try {
			return null == parent ? null : parent.getCanonicalPath();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
		
	}

	public static File getParent(File file, int level) {
		if ((level < 1) || (null == file))
			return file;
		File parentFile;
		try {
			parentFile = file.getCanonicalFile().getParentFile();
		} catch (IOException e) {
			throw new IORuntimeException(e);
		}
		if (1 == level) {
			return parentFile;
		}
		return getParent(parentFile, level - 1);
	}

	public static File checkSlip(File parentFile, File file) throws IllegalArgumentException {
		if ((null != parentFile) && (null != file)) {
			String parentCanonicalPath;
			String canonicalPath;
			try {
				parentCanonicalPath = parentFile.getCanonicalPath();
				canonicalPath = file.getCanonicalPath();
			} catch (IOException e) {
				throw new IORuntimeException(e);
			}
			if (false == canonicalPath.startsWith(parentCanonicalPath)) {
				throw new IllegalArgumentException("New file is outside of the parent dir: " + file.getName());
			}
		}
		return file;
	}

	public static String getMimeType(String filePath) {
		return URLConnection.getFileNameMap().getContentTypeFor(filePath);
	}
	
	
	public static String writeTOFile(StringBuffer content,String filePath,String filaName){
		BufferedWriter bw = null;
		FileWriter fw = null;
		String reportFilePath = "";
		try {
			reportFilePath = createFilePath(filePath,filaName);
			File file = new File(reportFilePath);
			if (!file.getParentFile().exists()){
				if (!file.getParentFile().mkdirs()){
					logger.info("创建文件所在目录失败！");
				}
			}
			if (!file.exists()){
				if (!file.createNewFile()){
					logger.info("创建文件失败！");
				}
			}
			fw = new FileWriter(file,false);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
			bw.flush();
		} catch (IOException e) {
			logger.error("写入文件"+filaName+"失败！",e);
		} finally {
			try {
				if(bw != null){
					bw.close();
				}
				if(fw != null){
					fw.close();
				}
			} catch (IOException e) {
				logger.error("关闭工作流失败！",e);
			}
			
		}
		return reportFilePath;
	}
	
	public static void writeTOFile(StringBuffer content,String fileName){
		BufferedWriter bw = null;
		FileWriter fw = null;
		try {
			File file = new File(fileName);
			fw = new FileWriter(file,true);
			bw = new BufferedWriter(fw);
			bw.write(content.toString());
			bw.flush();
		} catch (IOException e) {
			logger.error("写入文件"+fileName+"失败！",e);
		}finally {
			try {
				if(bw != null){
					bw.close();
				}
				if(fw != null){
					fw.close();
				}
			} catch (IOException e) {
				logger.error("关闭工作流失败！",e);
			}
		} 
	}
	
	public static String createFilePath(String filePath,String filaName){
		Date date = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");  
		String dates = formatter.format(date).toString();
		return filePath+File.separator+dates+File.separator+filaName;
	}	
	
}
