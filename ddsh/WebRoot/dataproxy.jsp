<%@page import="java.net.URLDecoder"%>
<%@page import="java.awt.Robot"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%
	if(request.getParameter("money")!=null){
		String a = request.getParameter("money");
		System.out.println(URLDecoder.decode(a,"UTF-8"));
	}

	int start = 1;
	int end = 100;
	int perPage = 10;
	
	//三个内置参数
	if(request.getParameter("startrecord")!=null && request.getParameter("endrecord")!=null && request.getParameter("perpage")!=null){
		System.out.println((String)request.getParameter("startrecord"));
		System.out.println((String)request.getParameter("endrecord"));
		System.out.println((String)request.getParameter("perpage"));
		start = Integer.parseInt((String)request.getParameter("startrecord"));
		end = Integer.parseInt((String)request.getParameter("endrecord"));
		perPage = Integer.parseInt((String)request.getParameter("perpage"));
	}
	
	//以下是一些示范数据，可以自己去组织，可以自己组织成带链接的表格等形式，这里为循环部分，例如循环的tr
	String[] store = {
		"<input type='checkbox' name='id' value='1'/>{id} 多国华人华侨举行反“藏独”游行 视频 专题 <input type='button' value='测试' onclick='test()'/><br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"<input type='checkbox' name='id' value='1'/>{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 多国华人华侨举行反“藏独”游行 视频 专题 <br/>",
		"{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 宇多田光 许飞 张惠妹乐库全新改版 <br/>",
		"{id} 全方位视听体验 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 多国华人华侨举行反“藏独”游行 视频 专题 <br/>",
		"{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 多国华人华侨举行反“藏独”游行 视频 专题 <br/>",
		"{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 宇多田光 许飞 张惠妹乐库全新改版 <br/>",
		"{id} 全方位视听体验 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 多国华人华侨举行反“藏独”游行 视频 专题 <br/>",
		"{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 多国华人华侨举行反“藏独”游行 视频 专题 <br/>",
		"{id} 组图：西藏警方悬赏通缉打砸抢烧疑犯 <br/>",
		"{id} 我国改革开放30年成为博鳌论坛热议焦点 专题 <br/>",
		"{id} 奥运圣火抵达阿曼马斯喀特 华人护圣火 视频 <br/>",
		"{id} 请参与全球华人反分裂护圣火签名活动 <br/>",
		"{id} 刘兆玄将任台“行政院长” 江丙坤任海基会董事长<br/>",
		"{id} 国家粮食局长撰文解读粮油安全 广东成第一缺粮省<br/>",
		"{id} 湖北当阳女市长撞死男童续 交警部门被指不作为 <br/>",
		"{id} 香港金像奖揭晓 《投名状》揽八项大奖 视频集 <br/>",
		"{id} 江西鄱阳高速路员工报警被民警击毙(组图) <br/>",
		"{id} 清华大学教授秦晖建议深圳率先兴建贫民区 <br/>",
		"{id} 视频：实拍南京女大学生裹床单在食堂打饭 <br/>",
		"{id} 博客：培养1个飞行员多少钱 黄健翔：足球记者敢说真话 <br/>",
		"{id} 17时成龙李连杰聊《功夫之王》 MLTR乐队聊奥运歌曲 <br/>",
		"{id} 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>",
		"{id} 宇多田光 许飞 张惠妹乐库全新改版 <br/>",
		"{id} 全方位视听体验 乐库全新改版 全方位视听体验 宇多田光 许飞 张惠妹 <br/>"
	};
	start = Math.min(start,store.length);
	end = Math.min(end,store.length);
	
	int totalPage = 0;
	if (96%perPage == 0)
			totalPage=96 / perPage;
		else
			totalPage=(96 / perPage) + 1;
	//this.PageNumber=(int)Math.floor(RecordNumber/PageSize);
	
	System.out.println(totalPage);
	String content = "totalPage = " + totalPage + ";";
	content += "dataStore = [";
	for(int i=start-1;i<end;i++){
		content += "\""+store[i]+"\",";
	}
	content = content.substring(0,content.length()-1);
	content += "];";
	//延时，为了查看效果，实际使用不需要
	Robot r = new Robot();
    r.delay(1000);
    
    
	out.println(content);

	/*最终输出形式为
	totalPage = 10;//总的页数
	dataStore = [\"{id} 第一条记录内容\",\{id} 第二条记录内容"\",\"{id} 第三条记录内容\"................];//当前记录集
	*/
%>