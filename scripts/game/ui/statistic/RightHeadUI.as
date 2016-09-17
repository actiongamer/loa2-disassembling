package game.ui.statistic
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   
   public class RightHeadUI extends View
   {
      
      protected static var uiView:XML = <View width="235" height="60">
			  <ClipList value="0" clipWidth="90" align="left" url="png.uiDungeonScene.battles.clipList_headIcon" x="177" y="4" scale=".65" var="img_border"/>
			  <Image skin="png.comp.image" x="184" y="11" width="42" height="42" smoothing="true" var="img_head"/>
			  <Image skin="png.uiStatistic.img_bar_bg" x="171" y="43" scaleX="-1" width="166" height="14" var="bg"/>
			  <Label text="普罗米休斯+4" autoSize="left" x="23" y="21" color="0x3695ff" width="146" height="18" var="txt_name" align="right"/>
			  <Label text="0" autoSize="left" x="3" y="21" color="0xffe0a3" width="82" height="18" var="txt_sum"/>
			  <Image skin="png.uiStatistic.img_lvbg" x="184" y="43"/>
			  <Label text="Lv.10" autoSize="left" x="188" y="38" color="0xffe0a3" var="txt_level"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="181" y="1" scale=".7" var="d_0" width="30" height="27"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="193" y="1" scale=".7" var="d_1" width="30" height="27"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="205" y="1" scale=".7" var="d_2" width="30" height="22.714285714285715"/>
			  <ProgressBar skin="png.uiStatistic.progressBar_red" x="8" y="46" value="0" var="progress" alignRight="true"/>
			  <Image skin="png.uiStatistic.img_red_dot" x="46" y="41" var="dot" anchorX=".5" anchorY=".5" width="12" height="19"/>
			</View>;
       
      
      public var img_border:ClipList = null;
      
      public var img_head:Image = null;
      
      public var bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_sum:Label = null;
      
      public var txt_level:Label = null;
      
      public var d_0:ClipList = null;
      
      public var d_1:ClipList = null;
      
      public var d_2:ClipList = null;
      
      public var progress:ProgressBar = null;
      
      public var dot:Image = null;
      
      public function RightHeadUI()
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
