package game.ui.rankModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RankListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="545" height="30" name="render">
			  <Image skin="png.uiRankModule.选中框01" x="0" y="0" name="selectBox0"/>
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" x="0" y="-1" sizeGrid="4,4,4,4" width="545" height="30" alpha="0" mouseChildren="false"/>
			  <Image skin="png.a5.comps.img_block" x="273" y="15" anchorX="0.5" anchorY="0.5" width="545" height="30" var="img_bg" autoSize="true" name="selectBox1"/>
			  <Image skin="png.a5.comps.img_block" x="38" y="18" width="33" height="24" anchorX="0.5" anchorY="0.5" var="img_huangguan" autoSize="true"/>
			  <Image skin="png.a5.comps.img_block" x="99" y="17" width="25" height="16" anchorX="0.5" anchorY="0.5" var="img_vip" autoSize="true"/>
			  <Label autoSize="left" x="27" y="7" style="普通说明" var="txt_1" align="center" width="26" height="23"/>
			  <Label autoSize="center" x="252" y="5" style="普通说明" var="txt_3" align="center"/>
			  <Label autoSize="center" x="367" y="5" style="普通说明" var="txt_4" align="center"/>
			  <Label autoSize="center" x="465" y="5" style="普通说明" var="txt_5" align="center"/>
			  <Label autoSize="center" x="124" y="5" style="下划线黄色" var="txt_2" align="center" mouseChildren="true"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_huangguan:Image = null;
      
      public var img_vip:Image = null;
      
      public var txt_1:Label = null;
      
      public var txt_3:Label = null;
      
      public var txt_4:Label = null;
      
      public var txt_5:Label = null;
      
      public var txt_2:Label = null;
      
      public function RankListRenderUI()
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
