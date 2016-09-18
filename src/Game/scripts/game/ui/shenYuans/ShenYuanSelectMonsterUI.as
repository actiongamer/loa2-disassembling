package game.ui.shenYuans
{
   import morn.customs.components.FadeView;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   import morn.core.components.Button;
   
   public class ShenYuanSelectMonsterUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="600" height="400">
			  <Image skin="png.uiShenYuan.monster.img_bg" x="-44" y="-17" sizeGrid="170,40,170,10" height="484" width="955" centerX="0"/>
			  <Label text="按钮文字" autoSize="none" x="-5" y="437" style="按钮文字" width="610" height="20" align="center" var="txt_desc"/>
			  <Box x="-48" y="25" var="box0">
			    <Image skin="png.comp.image" x="12" y="50" width="206" height="346" var="face0" smoothing="true"/>
			    <Image skin="png.uiShenYuan.monster.img_bord" x="7" y="45"/>
			    <Button label="挑 战" x="55" style="按钮大黄" y="305" var="btn_fight0"/>
			    <Image skin="png.uiShenYuan.monster.img_easy" x="30" y="33"/>
			    <Image skin="png.uiShenYuan.monster.img_name"/>
			    <Label text="渐变1" autoSize="none" x="48" y="1" style="渐变绿" width="142" height="22" align="center" var="name0"/>
			    <Label text="按钮文字" autoSize="none" x="18" y="353" style="按钮文字" width="194" height="20" align="center" var="txt_power0"/>
			    <Button label="按钮" skin="png.uiShenYuan.btn_buzhen" x="138" y="66" stateNum="1" var="btn_buzhen0"/>
			    <Label text="渐变1" autoSize="none" x="35" y="256" style="渐变1" width="156" height="44" align="center" var="txt_star0" multiline="true" wordWrap="true"/>
			    <Image skin="png.uiShenYuan.img_lock" x="4" y="180" var="lock0"/>
			  </Box>
			  <Box x="185" y="25" var="box1">
			    <Image skin="png.comp.image" x="12" y="50" width="206" height="346" var="face1" smoothing="true"/>
			    <Image skin="png.uiShenYuan.monster.img_bord" x="7" y="45"/>
			    <Button label="挑 战" x="55" style="按钮大黄" y="305" var="btn_fight1"/>
			    <Image skin="png.uiShenYuan.monster.img_middle" x="30" y="33"/>
			    <Image skin="png.uiShenYuan.monster.img_name"/>
			    <Label text="渐变1" autoSize="none" x="48" y="1" style="渐变蓝" width="142" height="22" align="center" var="name1"/>
			    <Label text="按钮文字" autoSize="none" x="18" y="353" style="按钮文字" width="194" height="20" align="center" var="txt_power1"/>
			    <Button label="按钮" skin="png.uiShenYuan.btn_buzhen" x="138" y="66" stateNum="1" var="btn_buzhen1"/>
			    <Label text="渐变1" autoSize="none" x="35" y="256" style="渐变1" width="156" height="44" align="center" var="txt_star1" multiline="true" wordWrap="true"/>
			    <Image skin="png.uiShenYuan.img_lock" x="4" y="180" var="lock1"/>
			  </Box>
			  <Box x="418" y="25" var="box2">
			    <Image skin="png.comp.image" x="12" y="50" width="206" height="346" var="face2" smoothing="true"/>
			    <Image skin="png.uiShenYuan.monster.img_bord" x="7" y="45"/>
			    <Button label="挑 战" x="55" style="按钮大黄" y="305" var="btn_fight2"/>
			    <Image skin="png.uiShenYuan.monster.img_hard" x="30" y="33"/>
			    <Image skin="png.uiShenYuan.monster.img_name"/>
			    <Label text="渐变1" autoSize="none" x="48" y="1" style="渐变紫" width="142" height="22" align="center" var="name2"/>
			    <Label text="按钮文字" autoSize="none" x="18" y="353" style="按钮文字" width="194" height="20" align="center" var="txt_power2"/>
			    <Button label="按钮" skin="png.uiShenYuan.btn_buzhen" x="138" y="66" stateNum="1" var="btn_buzhen2"/>
			    <Label text="渐变1" autoSize="none" x="35" y="256" style="渐变1" width="156" height="44" align="center" var="txt_star2" multiline="true" wordWrap="true"/>
			    <Image skin="png.uiShenYuan.img_lock" x="4" y="180" var="lock2"/>
			  </Box>
			  <Button skin="png.uiShenYuan.monster.btn_close" x="708" y="-20" stateNum="1" var="btn_close"/>
			  <Label text="按钮文字" autoSize="none" x="513" y="-10" style="按钮文字" width="171" height="20" align="left" var="txt_times"/>
			  <Label text="\l999900198" autoSize="none" y="-10" style="加底标题" width="171" height="20" align="center" centerX="0" x="214.5"/>
			</FadeView>;
       
      
      public var txt_desc:Label = null;
      
      public var box0:Box = null;
      
      public var face0:Image = null;
      
      public var btn_fight0:Button = null;
      
      public var name0:Label = null;
      
      public var txt_power0:Label = null;
      
      public var btn_buzhen0:Button = null;
      
      public var txt_star0:Label = null;
      
      public var lock0:Image = null;
      
      public var box1:Box = null;
      
      public var face1:Image = null;
      
      public var btn_fight1:Button = null;
      
      public var name1:Label = null;
      
      public var txt_power1:Label = null;
      
      public var btn_buzhen1:Button = null;
      
      public var txt_star1:Label = null;
      
      public var lock1:Image = null;
      
      public var box2:Box = null;
      
      public var face2:Image = null;
      
      public var btn_fight2:Button = null;
      
      public var name2:Label = null;
      
      public var txt_power2:Label = null;
      
      public var btn_buzhen2:Button = null;
      
      public var txt_star2:Label = null;
      
      public var lock2:Image = null;
      
      public var btn_close:Button = null;
      
      public var txt_times:Label = null;
      
      public function ShenYuanSelectMonsterUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
