package game.ui.lotteryHeroModules.comps
{
   import morn.core.components.View;
   import morn.core.components.HBox;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   
   public class LHNextHighUI extends View
   {
      
      protected static var uiView:XML = <View width="300" height="23">
			  <HBox centerX="0" align="middle" var="box_nextHigh">
			    <Label text="再招" y="2" stroke="0x0" var="txt_nextHigh1" align="left" isHtml="true" style="二级框标题" bold="true" autoSize="left"/>
			    <ClipList value="73" align="left" url="png.a5.comps.clipList.clipList_S12" x="41" clipWidth="16" var="clip_nextHigh"/>
			    <Label text="次, 必得橙色伙伴" x="68" y="1" stroke="0x0" var="txt_nextHigh2" align="left" isHtml="true" style="二级框标题" bold="true" autoSize="left"/>
			  </HBox>
			</View>;
       
      
      public var box_nextHigh:HBox = null;
      
      public var txt_nextHigh1:Label = null;
      
      public var clip_nextHigh:ClipList = null;
      
      public var txt_nextHigh2:Label = null;
      
      public function LHNextHighUI()
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
