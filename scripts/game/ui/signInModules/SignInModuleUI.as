package game.ui.signInModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   
   public class SignInModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="800" height="550">
			  <PanelBg x="0" y="0" width="800" height="550"/>
			  <Image skin="png.uiSignIn.底部" x="20" y="35" width="759" height="514"/>
			  <Image skin="png.uiSignIn.人物" x="-177" y="-10" mouseEnabled="false" mouseChildren="false" width="959" height="558"/>
			  <List x="185" y="48" repeatX="7" repeatY="5" spaceX="0" spaceY="3" var="list_signIn">
			    <SignInRender name="render" runtime="game.ui.signInModules.SignInRenderUI"/>
			  </List>
			  <Button label="按钮" x="413" style="按钮大绿" y="488" var="btn_signIn"/>
			</PopModuleView>;
       
      
      public var list_signIn:List = null;
      
      public var btn_signIn:Button = null;
      
      public function SignInModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.signInModules.SignInRenderUI"] = SignInRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
