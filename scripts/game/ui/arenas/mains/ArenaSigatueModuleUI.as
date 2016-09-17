package game.ui.arenas.mains
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import morn.core.components.TextArea;
   
   public class ArenaSigatueModuleUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="373" height="200">
			  <Label text="剩余xx字" autoSize="none" x="28" y="168" style="普通说明" var="txt_tip" align="left" width="156" height="18"/>
			  <TextArea text="TextArea" x="25" y="49" style="普通说明" width="322" height="104" var="txt_content"/>
			  <Label text="可输入30个字" autoSize="none" x="25" y="49" style="普通说明暗色" var="txt_prompt" align="left" width="156" height="18"/>
			</AlertContent>;
       
      
      public var txt_tip:Label = null;
      
      public var txt_content:TextArea = null;
      
      public var txt_prompt:Label = null;
      
      public function ArenaSigatueModuleUI()
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
