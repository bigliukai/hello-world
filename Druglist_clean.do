
clear all
set more off


/*global rawdata  "/Users/wtfaidh/Dropbox/SP Clean/Cleaning of drug/Raw_Data"
global workdata "/Users/wtfaidh/Dropbox/SP Clean/Cleaning of drug/Work_Data"
global cleandata "/Users/wtfaidh/Dropbox/SP Clean/Cleaning of drug/Clean_Data"


cd "$rawdata"

*********************Step 1. 

 use disease_case.dta

 tostring disease_case__id, replace
 gen uniqid = interview__id + disease_case__id
 save "$workdata/drugid.dta", replace 
 
use drug_Q5.dta

 tostring disease_case__id, replace 
 gen uniqid = interview__id + disease_case__id
 
 merge m:1 uniqid using "$workdata/drugid.dta"
 drop if _merge!=3  //查过问卷表头部分，_merge=1/ _merge=2的情况为医生并没有对病例开药，但interview有空的此条病例的数据
 drop uniqid
 
 tostring disease_code, replace
 gen disease_case = substr(disease_code,-3,.)
 order disease_case
 
 gen Q5_3_other = Q5_3
 order Q5_3_other, after(Q5_3)
 
 sort Q5_3

 save "$workdata/drug_clean.dta"*/
*********************Step 2. 
 
 ,
 
 
 use"E:\研究所文档\云南3月\drug_clean.dta"
 list Q5_3_11 Q5_3 if strmatch(Q5_3, "丁*")
 replace Q5_3_other="丁桂儿脐贴" if Q5_3=="丁桂儿脐贴宁"
 replace Q5_3_other="颠茄片" if Q5_3=="丁茄片"
 
 list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "三磷酸腺苷*")
 replace Q5_3_other="三磷酸腺苷二钠注射液" if Q5_3=="三磷酸腺苷"
 

 replace Q5_3_other="二羟丙茶碱注射液" if Q5_3=="二羟丙茶碱注射液（喘定）" | strmatch(Q5_3,"喘*针")
 replace Q5_3_other="五维他口服溶液"   if Q5_3=="五维他（五维他口服溶液）"
 
 list Q5_3_11 Q5_3 if strmatch(Q5_3, "保和*")
 replace Q5_3_other="保和颗粒" if Q5_3=="保和丸颗粒"
 
 list Q5_3_11 Q5_3 if strmatch(Q5_3, "健*")
 replace Q5_3_other="止泻颗粒" if Q5_3=="健肠止泻颗粒" & Q5_3_11=="Z45021200"
 replace Q5_3_other="参苓健脾胃颗粒" if Q5_3=="健脾胃颗粒" & Q5_3_11=="Z53020789"
 
 list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "元胡*")
 replace Q5_3_other="元胡止痛片" if Q5_3=="元胡止疼片" & Q5_3_11=="Z45021589"
 
 list Q5_3_11 Q5_3 if strmatch(Q5_3, "克*")
 replace Q5_3_other="酚氨咖敏" if Q5_3=="克感敏片"
 replace Q5_3_other="克林霉素磷酸酯注射液" if Q5_3=="克林霉素磷酸脂注射液" & Q5_3_11=="H20046006"
 
 replace Q5_3_other="冠心宁" if Q5_3=="冠心灵"
 
 list disease_case Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "利巴*")
 replace Q5_3_other="利巴韦林" if strmatch(Q5_3, "利巴伟林*")

 replace Q5_3_other="左氧氟沙星注射液" if Q5_3=="去氧氟沙星注射液"

 list disease_case Q5_3_11 Q5_3 if strmatch(Q5_3, "参*")
 replace Q5_3_other="参苓健脾胃颗粒" if strmatch(Q5_3, "参*健*")
 replace Q5_3_other="参苓白术颗粒" if strmatch(Q5_3, "参*白*颗粒")
 replace Q5_3_other="生脉胶囊" if Q5_3=="参麦胶（生脉胶囊）" & Q5_3_11=="Z44023258"
 
 replace Q5_3_other="双氯芬酸钠缓释胶囊" if Q5_3=="双氯芬酸缓释胶囊"

 list disease_case Q5_3_11 Q5_3 if strmatch(Q5_3, "口服*")
 replace Q5_3_other="复方丹参滴丸" if Q5_3=="口服复方丹参滴丸"
 
 replace Q5_3_other="口服补液盐散(Ⅰ)" if (Q5_3=="口服补液盐" |Q5_3=="口服补液盐散") & Q5_3_11=="H51023640"
 replace Q5_3_other="口服补液盐散(III)" if Q5_3=="口服补液盐3" |Q5_3=="口服补液盐（三类）"
 replace Q5_3_other="口服补液盐散" if Q5_3=="口服补盐液" | Q5_3=="口服液盐" | Q5_3=="口服盐溶液"
 
 replace Q5_3_other="多潘立酮片" if Q5_3=="吗丁啉片剂"
 replace Q5_3_other="枯草杆菌二联活菌颗粒" if strmatch(Q5_3, "吗咪*")

 list disease_case Q5_3_11 Q5_3 if strmatch(Q5_3, "呋喃*")
 replace Q5_3_other="呋喃唑酮片" if Q5_3=="呋喃唑铜片" & Q5_3_11=="H34022096"
 
 list disease_case Q5_3_11 Q5_3 if strmatch(Q5_3, "咳*")
 replace Q5_3_other="枸缘酸喷托维林" if strmatch(Q5_3, "咳必清*")
 
 *******************liukai*******
 
 gen Q5_3_11_other=" "

 list Q5_3_11 Q5_3 if strmatch(Q5_3, "思密*")
 replace Q5_3_other="蒙脱石散" if Q5_3=="思密达"||Q5_3=="斯密达"
 
list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "扑尔敏*")
replace Q5_3_other="扑尔敏片" if Q5_3=="扑尔敏"&& Q5_3_2==1
replace Q5_3_other="扑尔敏注射液" if Q5_3=="扑尔敏"&& Q5_3_2==7
replace Q5_3_other="扑尔敏注射液" if Q5_3=="朴尔敏针"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "振脑灵*")
replace Q5_3_11_other="Z10920037" if Q5_3_11=="Z1092003"
replace Q5_3_other="镇脑宁胶囊" if strmatch(Q5_3, "振脑灵*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "整肠生*")
replace Q5_3_other="地衣芽孢杆菌活菌胶囊" if strmatch(Q5_3, "整肠生*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "替硝唑")
replace Q5_3_other="替硝唑注射液" if strmatch(Q5_3, "替硝唑")
replace Q5_3_other="替硝唑氯化钠注射液注射液" if strmatch(Q5_3, "替硝锉氯化钠注射液")

replace Q5_3_other="板蓝根注射液" if strmatch(Q5_3, "板兰根*")
list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "板蓝根*")
replace Q5_3_other="板蓝根片" if Q5_3=="板蓝根"&&Q5_3_2==1

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "枯草杆菌*")
replace Q5_3_other="枯草杆菌二联活菌颗粒" if Q5_3=="枯草杆菌二联活菌"
replace Q5_3_other="枯草杆菌二联活菌颗粒" if Q5_3_11=="S20020037"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "枸椽*")
replace Q5_3_other="枸橼酸喷托维林片" if strmatch(Q5_3, "枸椽*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "柔软*")
replace Q5_3_other="鞣酸蛋白片" if strmatch(Q5_3, "柔软*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "柴胡*")
replace Q5_3_other="小柴胡冲剂" if strmatch(Q5_3, "柴胡冲*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "核酪*")
replace Q5_3_other="核酪注射液" if strmatch(Q5_3, "核酪*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "格林*")
replace Q5_3_other="林格氏液" if strmatch(Q5_3, "格林*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "格林*")
replace Q5_3_other="橘红颗粒" if strmatch(Q5_3, "桔红*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "止泻*")
replace Q5_3_other="涩肠止泻散" if strmatch(Q5_3_11, "Z20025892")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氨必*")
replace Q5_3_other="氨苄西林胶囊" if strmatch(Q5_3, "氨必*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氨溴*")
replace Q5_3_other="氨溴索注射液" if strmatch(Q5_3, "氨溴索")
replace Q5_3_other="氨溴索注射液" if strmatch(Q5_3, "氨溴索针")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氨苄*")
replace Q5_3_other="注射用氨苄西林钠" if strmatch(Q5_3_11, "H13021267")
replace Q5_3_other="注射用氨苄西林钠" if strmatch(Q5_3_11, "H37020587")
replace Q5_3_other="氨苄青霉素" if strmatch(Q5_3, "氨苄青")
replace Q5_3_other="氨苄青霉素" if strmatch(Q5_3, "氨苄霉素")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氨茶碱*")
replace Q5_3_other="氨茶碱片" if strmatch(Q5_3_11, "H37020629")
replace Q5_3_other="氨茶碱片" if Q5_3=="氨茶碱"&& Q5_3_2==1
replace Q5_3_other="氨茶碱注射液" if Q5_3=="氨茶碱"&& Q5_3_2==7
replace Q5_3_other="氨茶碱片" if Q5_3== "氨茶碱片剂"
replace Q5_3_other="氨茶碱注射液" if Q5_3== "氨茶碱针"&& Q5_3_2==9

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氯化钙*")
replace Q5_3_other="氯化钙注射液" if strmatch(Q5_3, "氯化钙")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "氯化钾*")
replace Q5_3_other="氯化钾注射液" if strmatch(Q5_3, "氯化钾")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "水溶*")
replace Q5_3_other="水溶性维生素" if strmatch(Q5_3, "水溶维*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "沙丁胺醇*")
replace Q5_3_other="沙丁胺醇气雾剂" if strmatch(Q5_3, "沙丁胺醇喷雾剂")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "沙刺*")
replace Q5_3_other="沙棘干乳剂" if strmatch(Q5_3, "沙刺*")

replace Q5_3_other="注射用头孢曲松钠" if strmatch(Q5_3, "注射液头孢曲松钠")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "注射用奥美*")
replace Q5_3_other="注射用奥美拉唑钠" if strmatch(Q5_3, "注射用奥美唑钠")
replace Q5_3_other="注射用奥美拉唑钠" if strmatch(Q5_3, "注射用奥美拉唑")
replace Q5_3_other="注射用奥美拉唑钠" if strmatch(Q5_3, "注射用奥美拉锉钠")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "注射用氨苄*")
replace Q5_3_other="注射用氨苄西林钠" if strmatch(Q5_3, "注射用氨苄西林")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "注射用阿莫西林*")
replace Q5_3_other="注射用阿莫西林钠克拉维酸钾" if strmatch(Q5_3, "注射用阿莫西林那克拉维酸钾")

replace Q5_3_other="注射用青霉素钠" if strmatch(Q5_3, "注射用青霉素")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "洛贝林*")
replace Q5_3_other="盐酸洛贝林注射液" if strmatch(Q5_3, "洛贝林*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "涩肠止泻*")
replace Q5_3_other="涩肠止泻散" if Q5_3=="涩肠止泻药"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "清开灵")
replace Q5_3_other="清开灵注射液" if strmatch(Q5_3, "清开灵")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "清开灵*")
replace Q5_3_11_other="Z10980098" if Q5_3_11=="210980098"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "炎琥宁*")
replace Q5_3_other="注射用炎琥宁" if Q5_3=="炎琥宁"&& Q5_3_2==8
replace Q5_3_other="炎琥宁注射液" if Q5_3=="炎琥宁"&& Q5_3_2==7
replace Q5_3_other="炎琥宁注射液" if Q5_3=="炎琥宁针"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "爱茂尔*")
replace Q5_3_other="溴米那普鲁卡因注射液" if Q5_3=="爱茂尔针"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "甘草*")
replace Q5_3_other="复方甘草片" if Q5_3=="甘草"||Q5_3=="甘草片"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "生脉*")
replace Q5_3_other="生脉饮" if Q5_3_11=="Z20044150"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "痢特*")
replace Q5_3_other="呋喃唑酮片" if strmatch(Q5_3, "痢特*")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "白及*")
replace Q5_3_11_other="Z53021451" if strmatch(Q5_3_11, "Z53024151")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸克林*")
replace Q5_3_other="盐酸克林霉素注射液" if strmatch(Q5_3, "盐酸克林霉素针")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸小*")
replace Q5_3_other="盐酸小檗碱片" if strmatch(Q5_3_11, "H53021162")
replace Q5_3_other="盐酸小檗碱片" if Q5_3=="盐酸小檗碱"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸左*")
replace Q5_3_other="盐酸左氧氟沙星氯化钠注射液" if Q5_3=="盐酸左氧氟沙星注射液"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸氟*")
replace Q5_3_other="盐酸氟桂利嗪胶囊" if Q5_3=="盐酸氟柱利嗪胶囊"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸氨*")
replace Q5_3_other="盐酸氨溴索片" if Q5_3=="盐酸氨溴索"
replace Q5_3_other="盐酸氨溴索口服溶液" if Q5_3=="盐酸氨溴索口服液"
replace Q5_3_other="盐酸氨溴索葡萄糖注射液" if strmatch(Q5_3_11, "H20052685")

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸消旋山*")
replace Q5_3_other="盐酸消旋山莨菪碱注射液" if Q5_3=="盐酸消旋山莨菪碱"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "盐酸雷尼*")
replace Q5_3_other="盐酸雷尼替丁胶囊" if Q5_3=="盐酸雷尼替丁胶"

list Q5_3_11 Q5_3_2 Q5_3 if strmatch(Q5_3, "硝酸*")
replace Q5_3_other="硝酸甘油片" if Q5_3=="硝酸甘油含片"
replace Q5_3_other="硝酸甘油片" if Q5_3=="硝酸甘油"&&Q5_3_2==1



















 
 
 
 
 
 
 
					
 

 

 
  

 
 
 
 
 
