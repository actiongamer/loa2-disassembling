package game.ui.miniMaps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import game.ui.commons.comps.others.RedPointNumUI;
   
   public class MiniMapHintRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="222" height="28">
			  <Label text="名字名字" var="txt_target" height="18" align="center" style="重要提示绿" buttonMode="true" underline="true" mouseChildren="false" x="32" y="5"/>
			  <Image skin="png.a5.comps.img_block" x="0" y="0" width="28" height="28" var="img_title"/>
			  <RedPointNum x="142" y="2" var="countPoint" runtime="game.ui.commons.comps.others.RedPointNumUI"/>
			</View>;
       
      
      public var txt_target:Label = null;
      
      public var img_title:Image = null;
      
      public var countPoint:RedPointNumUI = null;
      
      public function MiniMapHintRenderUI()
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
