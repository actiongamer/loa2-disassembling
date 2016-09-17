package game.ui.teams.listModules
{
   import morn.customs.components.AlertContent;
   import morn.core.components.Label;
   import morn.core.components.TextInput;
   
   public class EnterTeamByNoUI extends AlertContent
   {
      
      protected static var uiView:XML = <AlertContent width="382" height="250">
			  <Label x="46" y="108" var="txt_prompt" text="请输入队伍编号:" maxChars="12" autoSize="left" style="普通说明" width="120" height="21" align="right"/>
			  <TextInput x="171" y="105" var="txt_search" maxChars="12" autoSize="left" width="125" height="22" skin="png.a5.bgs.输入框" margin="2,3"/>
			</AlertContent>;
       
      
      public var txt_prompt:Label = null;
      
      public var txt_search:TextInput = null;
      
      public function EnterTeamByNoUI()
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
