package game.ui.statistic
{
   import morn.core.components.View;
   import morn.customs.components.ClipList;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   
   public class LeftHeadUI extends View
   {
      
      protected static var uiView:XML = <View width="235" height="60">
			  <ClipList value="0" clipWidth="90" align="left" url="png.uiDungeonScene.battles.clipList_headIcon" x="2" y="4" scale=".65" var="img_border"/>
			  <Image skin="png.comp.image" x="9" y="11" width="42" height="42" var="img_head"/>
			  <Image skin="png.uiStatistic.img_bar_bg" x="64" y="41" var="bg"/>
			  <Label text="普罗米休斯+4" autoSize="left" x="65" y="19" color="0x3695ff" height="18" var="txt_name"/>
			  <Label text="0" autoSize="none" x="147" y="19" color="0xffe0a3" width="87" height="18" var="txt_sum" align="right"/>
			  <Image skin="png.uiStatistic.img_lvbg" x="9" y="43"/>
			  <Label text="Lv.10" autoSize="left" x="12" y="38" color="0xffe0a3" var="txt_level" width="34" height="19"/>
			  <ProgressBar skin="png.uiStatistic.progressBar_green" x="67" y="44" var="progress" value="0"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="5" y="1" scale=".7" var="d_0" width="30" height="27"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="17" y="1" scale=".7" var="d_1" width="30" height="27"/>
			  <ClipList value="0" clipWidth="25" align="left" url="png.a5.comps.clipList.clipList_tupo" x="29" y="1" scale=".7" var="d_2"/>
			  <Image skin="png.uiStatistic.img_green_dot" x="137" y="40" var="dot" anchorX=".5" anchorY=".5"/>
			</View>;
       
      
      public var img_border:ClipList = null;
      
      public var img_head:Image = null;
      
      public var bg:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_sum:Label = null;
      
      public var txt_level:Label = null;
      
      public var progress:ProgressBar = null;
      
      public var d_0:ClipList = null;
      
      public var d_1:ClipList = null;
      
      public var d_2:ClipList = null;
      
      public var dot:Image = null;
      
      public function LeftHeadUI()
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
