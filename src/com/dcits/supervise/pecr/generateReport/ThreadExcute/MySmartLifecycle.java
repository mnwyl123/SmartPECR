package com.dcits.supervise.pecr.generateReport.ThreadExcute;

import java.lang.reflect.InvocationTargetException;
import java.util.Properties;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.SmartLifecycle;
import org.springframework.stereotype.Component;

import com.dcits.supervise.pecr.feedbackreport.service.ReportFeedBackMessageService;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.generateReport.service.ReportMessageManager;

@Component
public class MySmartLifecycle implements SmartLifecycle{

	private static final Logger logger = Logger.getLogger(MySmartLifecycle.class);
	private boolean isRunning = false;
    //执行线程池
    private ThreadPoolExecutor executor;
	//配置信息
    @Autowired
    private  ReportFeedBackMessageService reportFeedBackMessageService;
	@Autowired
    private Properties properties;
	@Autowired
	private ReportMessageManager reportMessageService;
    //线程池中线程序列号
    private AtomicInteger threadCount;
    //线程前缀
    private String prefixThreadName;
    //线程序列格式化
    private int formatThreadNumber;
    //拒绝策略
    private RejectedExecutionHandler rejectedExecutionHandler;
    //核心池大小
    private int corePoolSize;
    //线程池最大线程数
    private int maxPoolSize;
    //保留时间
    private int timeOut;
    //是否允许预启动线程
    private boolean prestartAllCoreThreads;
    //保留时间段
    private TimeUnit timeUnit;
    //使用的阻塞队列
    private BlockingQueue<Runnable> blockingQueue;
	
    /**
     * 当上下文被刷新（所有对象已被实例化和初始化之后）时，将调用该方法，默认生命周期处理器将检查每个Smartlifecycle
     * 对象的isAutoStartup()方法返回的布尔值：如果为“true"则该方法会被调用，而不是等待显示调用自己的start（）方法。
     */
	@Override
	public void start() {
		logger.info("SmartLifecycle启动start方法");
		this.init();
		this.createThreadTool();
		isRunning=true;
	}
	/**
	 * 初始化参数
	 */
	@SuppressWarnings("unchecked")
	public void init(){
		threadCount = new AtomicInteger(1);
		prefixThreadName = getProperty("prefixThreadName","handle-request-thread-");
        formatThreadNumber = parseInt(getProperty("formatThreadNumber","4"),4);
        rejectedExecutionHandler = (RejectedExecutionHandler)parseClassReturnObj(getProperty("rejectedExecutionHandler","java.util.concurrent.ThreadPoolExecutor$AbortPolicy"));
        corePoolSize = parseInt(getProperty("corePoolSize","50"),50);//100
        maxPoolSize = parseInt(getProperty("maxPoolSize","20"),20);
        timeOut = parseInt(getProperty("timeOut","0"),0);
        prestartAllCoreThreads = parseBoolean(getProperty("prestartAllCoreThreads","false"));
        timeUnit = getTimeUnit(getProperty("timeUnit","MILLISECONDS"));
        blockingQueue = (BlockingQueue<Runnable>)parseClassReturnObj(getProperty("blockingQueue","java.util.concurrent.ArrayBlockingQueue"));
	}
	/**
	 * 创建线程池
	 */
	public void createThreadTool(){
		System.out.println("启动线程池处理客户端任务");
		 logger.info("启动线程池处理客户端任务");
		if(logger.isDebugEnabled()){
            logger.debug("启动线程池处理客户端任务");
        }
		//初始化线程池
		executor= new ThreadPoolExecutor(corePoolSize, maxPoolSize, timeOut, timeUnit, blockingQueue, rejectedExecutionHandler);
		//设定线程工厂
		
		//是否在线程池启动时预先创建核心线程
        if(prestartAllCoreThreads){
            executor.prestartAllCoreThreads();
        }
	}
	/**
	 * 创建新线程
	 * 20210526，此处将new ServiceHandleExcutor 对象显示创建一个对象，有利于资源释放
	 * @param needReportDetail
	 * @return
	 */
	public boolean generateThread(NeedReportDetail needReportDetail,String name)  {
		logger.info("创建线程处理客户端任务");
		ServiceHandleExcutor serviceHandleExcutor = new ServiceHandleExcutor(needReportDetail,properties,reportMessageService,reportFeedBackMessageService,name);
		executor.execute(serviceHandleExcutor);
		return true;
	}
	
	/**
	 * 
	 * @param needReportDetail
	 * @param name 用户名
	 * @param spFlag noVerify--不用进行预处理校验步骤
	 * @return
	 */
	public boolean generateThread(NeedReportDetail needReportDetail,String name,String spFlag)  {
		logger.info("创建线程处理客户端任务--特殊");
		ServiceHandleExcutor serviceHandleExcutor = new ServiceHandleExcutor(needReportDetail,properties,reportMessageService,reportFeedBackMessageService,name,spFlag);
		executor.execute(serviceHandleExcutor);
		return true;
	}

	/**
     * 根据key获取properties的value
     */
    public String getProperty(String propertyName,String defaultValue){
        checkNotNull(properties);
        String propertyValue = properties.getProperty(propertyName);
        return propertyValue==null||propertyValue.equals("")?defaultValue:propertyValue;
    }
    
    
    /**
     * 空值判断
     * @param object
     */
	public void checkNotNull(Object object){
        if(object==null){
            throw new RuntimeException("未初始化");
        }
    }
    
    /**
     * 整数解析
     * @param intString
     * @return
     */
    public int parseInt(String intString,int defaultValue){
        try {
            return Integer.parseInt(intString);
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }


    /**
     * boolean解析
     * @param boolString
     * @return
     */
    public boolean parseBoolean(String boolString) {
         return Boolean.parseBoolean(boolString);
    }

    /**
     * 获取TimeUnit枚举对象
     * @return
     */
    public TimeUnit getTimeUnit(String timeUnit){
        switch (timeUnit){
            case "NANOSECONDS": return  TimeUnit.NANOSECONDS;
            case "MICROSECONDS":return  TimeUnit.MICROSECONDS;
            case "MILLISECONDS":return  TimeUnit.MILLISECONDS;
            case "SECONDS":return  TimeUnit.SECONDS;
            case "MINUTES":return  TimeUnit.MINUTES;
            case "HOURS":return  TimeUnit.HOURS;
            case "DAYS":return  TimeUnit.DAYS;
            default: return TimeUnit.MILLISECONDS;
        }
    }
    
    /**
     * 动态加载实例
     * @param classFullName
     * @return
     */
    public Object parseClassReturnObj(String classFullName){
        try{
            if(classFullName.contains("ArrayBlockingQueue")){
                String[] splitArray = classFullName.split("\\|");
                int size = 200;
                String realClassName = splitArray[0];
                return Class.forName(realClassName).getDeclaredConstructor(int.class).newInstance(size);
            }
            return Class.forName(classFullName).newInstance();
        } catch (ClassNotFoundException ex){
            logger.error("没有这样的类:"+ex.getMessage(),ex);
            return null;
        } catch (IllegalAccessException ex){
            logger.error("不合法的调用:"+ex.getMessage(),ex);
            return null;
        } catch (InstantiationException ex){
            logger.error("无法实例化对象:"+ex.getMessage(),ex);
            return null;
        } catch (NoSuchMethodException ex){
            logger.error("没有找到合适的构造器:"+ex.getMessage(),ex);
            return null;
        } catch (InvocationTargetException ex){
            logger.error("调用方法异常:"+ex.getMessage(),ex);
            return null;
        }
    }
    
    /**
     * 如果工程中有多个实现接口smartlifecycle的类。则这些类的start的执行顺序按getphase()方法返回的值从小到大执行
     * stop方法执行的顺序则相反，getPhase()返回较大类的stop方法先被调用，小的后被调用。
     */
    @Override
	public int getPhase() {
		return 0;
	}
    
    /**
     * 根据该方法的返回值决定是否执行start方法，返回true时start方法会被自动调用，返回false则不会
     */
    @Override
	public boolean isAutoStartup() {
		return true;
	}
    /**
     * 确定是执行start方法  还是执行 stop方法
     * 1，该方法返回false时，start方法才会被执行，
     * 2，改方法返回true，stop(Runnable callbacl)或stop()方法才会被执行
     */
    @Override
	public boolean isRunning() {
		return isRunning;
	}
    
    /**
     * Smartlifecycle 子类才会有的方法，当isRunning方法返回true时，该方法才会被调用
     */
    @Override
	public void stop(Runnable callback) {
    	/**
    	 * 如果让isRunning返回true，需要执行stop这个方法，那么就不要忘记调用callback.run()方法，
    	 * 否则在程序退出时，spring的defaultlifecycleprocessor会认为你这个当前的smartlifecycle实现类没有
    	 * stop完成，程序会一直卡着结束不了，等待一定时间(默认是30秒)后才会自动结束
    	 * PS：如果你想修改这个默认时间，可以按照下面的思路做，当然下面是springmvc配置文件形式的参考，在SpringBoot中
    	 * 自然不是配置xml来完成，这里只是提供一种方法：
    	 * <bean id="lifecyleProcessor" class="org.springframework.context.support.DefaultLifecycleProcessor" >
    	 * 		<!--timeout value in milliseconds-->
    	 * 		<property name="timeoutPerShutdownPhase" value ="10000"/>
    	 * </bean>
    	 */
		callback.run();
        isRunning = false;
	}
	
    
    /**
     * 接口lifecycle的子类的方法，只有非Smartlifecycle的 
     * 1:该方法只对实现接口lifecycle的类才起作用，对实现Smartlifecyle接口的类无效
     * 2：方法stop（）和stop(Runnable callback)的区别只在于，后者是Smartlifecycle子类的专属
     */
	@Override
	public void stop() {
		isRunning = false;
	}


	
	
}
