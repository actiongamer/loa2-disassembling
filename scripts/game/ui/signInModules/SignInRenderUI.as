package game.ui.signInModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class SignInRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="84" height="84">
			  <Image skin="png.uiSignIn.选中" x="0" y="0" width="84" height="84" name="selectBoxAll" var="signinselect"/>
			  <Image skin="png.uiSignIn.道具底框" x="1" y="1" var="img_backframe" width="80" height="80" mouseEnabled="true" mouseChildren="false"/>
			  <List x="11" y="11" var="list_source">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			  <Image skin="png.uiSignIn.三角" x="2" y="2" var="img_sanjiao" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiSignIn.勾" x="10" y="20" var="img_gou" mouseChildren="false" mouseEnabled="false"/>
			  <Label autoSize="center" x="4" y="30" style="渐变2" width="42" height="17" var="txt_vip" rotation="-45" mouseEnabled="false" mouseChildren="false" size="11"/>
			</View>;
       
      
      public var signinselect:Image = null;
      
      public var img_backframe:Image = null;
      
      public var list_source:List = null;
      
      public var img_sanjiao:Image = null;
      
      public var img_gou:Image = null;
      
      public var txt_vip:Label = null;
      
      public function SignInRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRender60X60UI"] = WealthRender60X60UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
