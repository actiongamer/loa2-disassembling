package game.ui.signInModules
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class FSignInModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="1123" height="663">
			  <Image skin="png.uiSignIn.底框" x="129" y="103"/>
			  <Image skin="png.uiSignIn.人物" x="0" y="0"/>
			  <Image skin="png.uiSignIn.旗帜" x="235" y="131"/>
			  <Image skin="png.uiSignIn.底" x="254" y="153"/>
			  <Image skin="png.uiSignIn.下透明底" x="186" y="572"/>
			  <List x="433" y="151" repeatX="7" repeatY="5" spaceX="0" spaceY="0" var="list_signIn">
			    <FSignInRender name="render" runtime="game.ui.signInModules.FSignInRenderUI"/>
			  </List>
			  <Label x="607" y="600" width="138" height="22" var="txtCollected" rotation="0" mouseEnabled="false" mouseChildren="false" size="14" text="\l10600041" align="center" style="渐变黄"/>
			  <Button label="按钮" x="618" style="按钮大绿" y="595" var="btn_signIn"/>
			  <Label x="268" y="170" style="渐变黄" width="125" height="66" rotation="0" mouseEnabled="false" mouseChildren="false" size="20" text="\l999000576" align="center" multiline="true" wordWrap="true"/>
			  <Image skin="png.uiSignIn.数字透明底" x="283" y="246"/>
			  <Image skin="png.uiSignIn.标题头" x="341" y="3"/>
			  <Button label="按钮" x="271" style="按钮大绿" y="488" var="btn_collect"/>
			  <Label autoSize="center" x="268" y="244" width="125" height="22" var="txtSignCombo" rotation="0" mouseEnabled="false" mouseChildren="false" size="14" text="2/2" align="center"/>
			  <Label autoSize="center" x="510" y="93" width="300" height="36" var="txtTitle" rotation="0" mouseEnabled="false" mouseChildren="false" size="25" text="2/2" align="center" style="渐变2"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="129" stateNum="1" var="btn_close" x="1040"/>
			  <List x="298" y="280" repeatX="1" repeatY="5" spaceX="0" spaceY="5" var="list_numSignIn">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			</PopModuleView>;
       
      
      public var list_signIn:List = null;
      
      public var txtCollected:Label = null;
      
      public var btn_signIn:Button = null;
      
      public var btn_collect:Button = null;
      
      public var txtSignCombo:Label = null;
      
      public var txtTitle:Label = null;
      
      public var btn_close:Button = null;
      
      public var list_numSignIn:List = null;
      
      public function FSignInModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         viewClassMap["game.ui.signInModules.FSignInRenderUI"] = FSignInRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
