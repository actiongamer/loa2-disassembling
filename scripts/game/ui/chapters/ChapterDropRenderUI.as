package game.ui.chapters
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Label;
   
   public class ChapterDropRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="117" height="18">
			  <Label y="0" style="普通说明" width="117" multiline="false" wordWrap="true" align="left" text="掉落：" leading="4" height="18" x="0" var="txt_name"/>
			</WealthRender>;
       
      
      public var txt_name:Label = null;
      
      public function ChapterDropRenderUI()
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
