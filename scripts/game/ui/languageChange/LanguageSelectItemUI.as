package game.ui.languageChange
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class LanguageSelectItemUI extends View
   {
      
      protected static var uiView:XML = <View width="92" height="90">
			  <Image skin="png.comp.image" x="6" y="5" width="80" height="60" var="flagimg"/>
			  <Image skin="png.uiCommon.language.selected" x="0" y="0" var="guang"/>
			  <Label autoSize="none" x="3" y="68" bold="false" width="88" var="nametxt" height="23" align="center" mouseChildren="false" mouseEnabled="false" style="重要提示黄" multiline="false" wordWrap="true" text="English"/>
			  <Image skin="png.uiCommon.language.select_gou" x="53" y="37" var="flaggou"/>
			</View>;
       
      
      public var flagimg:Image = null;
      
      public var guang:Image = null;
      
      public var nametxt:Label = null;
      
      public var flaggou:Image = null;
      
      public function LanguageSelectItemUI()
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
