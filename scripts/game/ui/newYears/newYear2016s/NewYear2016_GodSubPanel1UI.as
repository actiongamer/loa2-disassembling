package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Label;
   import morn.core.components.ProgressBar;
   import morn.core.components.Image;
   
   public class NewYear2016_GodSubPanel1UI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="500">
			  <Button label="放鞭炮" x="196" style="按钮大绿" y="439" var="btn_get"/>
			  <Label text="每天打boss" autoSize="none" x="13" y="344" style="普通说明" width="481" height="21" align="center" var="txt_tip1" size="13"/>
			  <ProgressBar skin="png.a5.comps.progresses.progress_S10" x="87" y="312" sizeGrid="5,0,18,0" var="progressBar"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_progressBarBg" x="54" y="272"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_progressShine" x="85" y="291" var="img_progressShine"/>
			  <Label text="祝福值: 11313/1313" autoSize="none" x="183" y="314" style="普通说明" width="162" height="21" align="center" var="txt_val"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_item1" x="224" y="366" var="icon_item1"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_item2" x="225" y="367" var="icon_item2"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var txt_tip1:Label = null;
      
      public var progressBar:ProgressBar = null;
      
      public var img_progressShine:Image = null;
      
      public var txt_val:Label = null;
      
      public var icon_item1:Image = null;
      
      public var icon_item2:Image = null;
      
      public function NewYear2016_GodSubPanel1UI()
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
