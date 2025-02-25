package com.dcits.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.apache.commons.io.IOUtils;
import org.springframework.context.SmartLifecycle;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dcits.supervise.pecr.generateReport.ThreadExcute.ServiceHandleExcutor;
import com.dcits.supervise.pecr.generateReport.entity.NeedReportDetail;
import com.dcits.supervise.pecr.util.DealWithFile;
import com.dcits.supervise.pecr.util.StringDateUtil;

@Component
public class Wzy implements SmartLifecycle{

	Boolean isRunning = false;
	
	//执行线程池
    private ThreadPoolExecutor executor;
    //是否允许预启动线程
    private boolean prestartAllCoreThreads = true;
    
    //核心池大小
    private int corePoolSize=3;
    //线程池最大线程数
    private int maxPoolSize=10;
    //保留时间
    private int timeOut=0;
    //延迟单位（秒）
    private TimeUnit timeUnit=TimeUnit.MILLISECONDS;
    //使用的阻塞队列(有界队列)
    private BlockingQueue<Runnable> blockingQueue = new ArrayBlockingQueue<Runnable>(20);
    //拒绝策略AbortPolicy(中断抛出异常)
    private RejectedExecutionHandler rejectedExecutionHandler = new ThreadPoolExecutor.AbortPolicy();
    
	
    /**
     * 确定是执行start方法  还是执行 stop方法
     * 1，该方法返回false时，start方法才会被执行，
     * 2，改方法返回true，stop(Runnable callbacl)或stop()方法才会被执行
     */
	@Override
	public boolean isRunning() {
		// TODO Auto-generated method stub
		return isRunning;
	}

	@Override
	public void start() {
		System.out.println("SmartLifecycle启动start方法");
		//初始化线程池
		this.createThreadTool();
		isRunning=true;
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stop() {
		// TODO Auto-generated method stub
		isRunning = false;
	}

	/**
	 * 执行顺序   越小执行顺序越优先
	 */
	@Override
	public int getPhase() {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 第一个执行   判断是否执行start,true执行   false不执行
	 */
	@Override
	public boolean isAutoStartup() {
		System.out.println("isAutoStartup.....................wzy123.");
		// TODO Auto-generated method stub
		return true;
	}

	//当isRunning方法返回true时，该方法才会被调用
	@Override
	public void stop(Runnable arg0) {
		// TODO Auto-generated method stub
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
		arg0.run();
        isRunning = false;
	}
	
	/**
	 * 创建新线程（复用线程池中的线程，只需调用此方法来复用线程池中的线程）
	 * @param needReportDetail
	 * @return
	 */
	public boolean generateThread()  {
		System.out.println("创建线程处理客户端任务");
		executor.execute(new MyThreadTo());
		return true;
	}
	
	/**
	 * 创建线程池
	 */
	public void createThreadTool(){
		System.out.println("启动线程池处理客户端任务");
		//初始化线程池
		executor= new ThreadPoolExecutor(corePoolSize, maxPoolSize, timeOut, timeUnit, blockingQueue, rejectedExecutionHandler);
		
		//是否在线程池启动时预先创建核心线程
        if(prestartAllCoreThreads){
            executor.prestartAllCoreThreads();
        }
	}

}
