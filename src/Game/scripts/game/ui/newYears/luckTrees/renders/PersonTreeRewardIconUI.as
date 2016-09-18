package game.ui.newYears.luckTrees.renders
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.GCircle;
   
   public class PersonTreeRewardIconUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="53" height="53">
			  <Image skin="png.uiLuckTree.personTree.img_icon_bg" var="img_bg1" sizeGrid="6,6,6,6" width="50" height="50"/>
			  <Image skin="png.comp.image" x="11" y="10" var="img_icon" width="30" height="30"/>
			  <Label text="999" stroke="0xffffff" mouseEnabled="false" var="txt_num" width="54" align="right" x="-4" y="30" backgroundColor="0xcfbeaf" color="0xffffff"/>
			  <GCircle fillAlpha="0.5" lineAlpha="0" x="11" y="10" width="30" height="30" var="img_mask"/>
			</WealthRender>;
       
      
      public var img_bg1:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_num:Label = null;
      
      public var img_mask:GCircle = null;
      
      public function PersonTreeRewardIconUI()
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
