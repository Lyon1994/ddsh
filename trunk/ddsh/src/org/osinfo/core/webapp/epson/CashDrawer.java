/**
 ************************************************
 * @Company 上海竹枫信息技术有限公司
 * @WebSite http://www.zf-info.com
 * @Organize 欧斯英孚开源组织 http://www.osinfo.org
 * @Founder Lucifer.Zhou 
 * @MSN zhoujianguo_leo@hotmail.com
 * @Mail leo821031@gmail.com
 * 竹枫含义：
 * 【典故】君向楚，我归秦，便分路青竹丹枫。
 * 【释义】青竹生南方，丹枫长北地。借指南北。 
 ************************************************
 */
package org.osinfo.core.webapp.epson;

import java.io.IOException;

/**
 * @Date 2010-7-30 上午11:00:49
 * @Description 描述
 * 开启钱箱
 */
public class CashDrawer {
	private static void openDrawer(String portName, PosPrinter pp/*这是POS机的配置*/)
    throws Exception {
	CommPortIdentifier port = null;
	CommPort open = null;
	try {
	    port = CommPortIdentifier.getPortIdentifier(portName);
	    open = port.open(portName, 100);
	    open.setInputBufferSize(32);
	    open.setOutputBufferSize(32);
	    OutputStream outputStream = open.getOutputStream();
	    //设置开启钱箱的脉冲频率，一般不用设置，默认就行
	    if (pp.getPc().hasDrawerConfig()) {
	        if (pp.getPc().getDrawerRate() == 2400) {
	            outputStream.write(EpsonPosPrinterCommand.ESC_DRAWER_RATE_2400);
	        } else {
	            outputStream.write(EpsonPosPrinterCommand.ESC_DRAWER_RATE_9600);
	        }
	        int ontime = pp.getPc().getDrawerOntime();
	        int offtime = pp.getPc().getDrawerOfftime();
	        outputStream.write(EpsonPosPrinterCommand
	                .generatePulse(ontime, offtime));
	        outputStream.write(EpsonPosPrinterCommand.ESC_OPEN_DRAWER);
	    } else {//默认设置
	        outputStream.write(EpsonPosPrinterCommand.ESC_DRAWER_RATE_9600);
	        int ontime = 50;
	        int offtime = 50;
	        outputStream.write(EpsonPosPrinterCommand.generatePulse(ontime, offtime));
	        outputStream.write(EpsonPosPrinterCommand.ESC_OPEN_DRAWER);
	    }
	    outputStream.flush();
	    java.util.concurrent.TimeUnit.SECONDS.sleep(1);
	    outputStream.close();
	} catch (Exception e) {
	    e.printStackTrace();
	    if (e instanceof IOException
	        && e.getMessage()
	                .startsWith("Resource temporarily unavailable")) {
	    } else {
	        throw e;
	    }
	} finally {
	    if (port != null && port.isCurrentlyOwned()) {
	        open.close();
	    }
	}
	}
}
