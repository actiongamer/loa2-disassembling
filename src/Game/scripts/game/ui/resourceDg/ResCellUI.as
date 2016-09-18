package game.ui.resourceDg
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Clip;
   import game.ui.commons.comps.others.RedPointNumUI;
   import morn.customs.components.ClipList;
   import morn.customs.components.GCircle;
   
   public class ResCellUI extends View
   {
      
      protected static var uiView:XML = <View width="235" height="189" var="img_bg">
			  <Image skin="png.uiMainCitys.resDg.img_back" x="0" y="0"/>
			  <Image skin="png.uiMainCitys.resDg.img_face" x="24" y="8" var="icon_face"/>
			  <Image skin="png.uiMainCitys.resDg.img_hl" x="17" y="1" var="img_hl"/>
			  <Image skin="png.uiMainCitys.resDg.img_glass" x="25" y="8"/>
			  <Image skin="png.uiMainCitys.resDg.img_down" x="61" y="159"/>
			  <Image skin="png.uiMainCitys.resDg.img_icon1" x="75" y="171" var="img_icon" smoothing="true" width="40" height="40" anchorX=".5" anchorY=".5"/>
			  <Label text="经验卷轴" autoSize="none" y="163" style="渐变1" width="179" height="22" align="center" var="txt_res" x="44"/>
			  <Label text="剩余次数：" autoSize="none" x="9" y="139" style="普通说明" width="144" height="18" align="right" var="txt_state" language="en" lgx="30,9" lgy="139,139"/>
			  <Clip skin="png.uiMainCitys.resDg.clip_bei" x="45" y="-6" clipX="7" var="icon_bei"/>
			  <RedPointNum x="167" y="4" var="redpoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			  <ClipList value="5" clipWidth="13" align="left" url="png.a5.comps.clipList.clipList_S7" x="156" y="137" var="times" language="en" lgx="170,156" lgy="137,137"/>
			  <Label text="今日女神闯关活动已经结束" autoSize="center" x="66.5" y="121" align="center" width="130" color="0xff6600" var="txt_next" style="普通说明" multiline="true" wordWrap="true"/>
			  <Image skin="png.uiMainCitys.resDg.img_chain" x="47" y="44" visible="false" var="img_chain"/>
			  <GCircle fillAlpha="0.5" lineAlpha="0" x="39" y="8" width="180" height="180" var="hot_area"/>
			</View>;
       
      
      public var img_bg:View = null;
      
      public var icon_face:Image = null;
      
      public var img_hl:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_res:Label = null;
      
      public var txt_state:Label = null;
      
      public var icon_bei:Clip = null;
      
      public var redpoint:RedPointNumUI = null;
      
      public var times:ClipList = null;
      
      public var txt_next:Label = null;
      
      public var img_chain:Image = null;
      
      public var hot_area:GCircle = null;
      
      public function ResCellUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.RedPointNumUI"] = RedPointNumUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
