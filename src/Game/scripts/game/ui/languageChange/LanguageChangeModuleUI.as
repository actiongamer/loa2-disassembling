package game.ui.languageChange
{
   import morn.customs.components.FadeView;
   import morn.core.components.Image;
   import morn.core.components.List;
   
   public class LanguageChangeModuleUI extends FadeView
   {
      
      protected static var uiView:XML = <FadeView width="397" height="400">
			  <Image skin="png.uiCommon.language.bg" x="0" y="0" width="397" height="346" sizeGrid="10,10,10,10" var="bg"/>
			  <List x="8" y="48" repeatX="4" var="flagList" spaceX="5" width="383">
			    <LanguageSelectItem name="render" runtime="game.ui.languageChange.LanguageSelectItemUI"/>
			    <Label autoSize="none" x="6" y="-33" bold="false" width="373" height="23" align="center" mouseChildren="false" mouseEnabled="false" style="重要提示黄" multiline="false" wordWrap="true" text="\l999001140" size="14"/>
			  </List>
			</FadeView>;
       
      
      public var bg:Image = null;
      
      public var flagList:List = null;
      
      public function LanguageChangeModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.languageChange.LanguageSelectItemUI"] = LanguageSelectItemUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
