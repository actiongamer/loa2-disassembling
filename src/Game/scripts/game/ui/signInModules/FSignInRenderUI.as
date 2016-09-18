package game.ui.signInModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRender60X60UI;
   
   public class FSignInRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="84" height="84">
			  <Image skin="png.uiSignIn.底框-暗" x="2" y="2"/>
			  <Image skin="png.uiSignIn.底框-亮" x="2" y="2" var="img_backframe" name="selectBoxAll"/>
			  <List x="10" y="7" var="list_source">
			    <WealthRender60X60 name="render" runtime="game.ui.commons.icons.WealthRender60X60UI"/>
			  </List>
			  <Image skin="png.uiSignIn.三角" x="1" y="2" var="img_sanjiao" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.uiSignIn.勾" x="9" y="21" var="img_gou" mouseChildren="false" mouseEnabled="false"/>
			  <Label autoSize="center" x="3" y="30" style="渐变2" width="42" height="17" var="txt_vip" rotation="-45" mouseEnabled="false" mouseChildren="false" size="14"/>
			  <Label autoSize="center" x="18" y="19" style="渐变2" width="42" height="17" var="txt_vip2" rotation="-45" mouseEnabled="false" mouseChildren="false" size="11"/>
			</View>;
       
      
      public var img_backframe:Image = null;
      
      public var list_source:List = null;
      
      public var img_sanjiao:Image = null;
      
      public var img_gou:Image = null;
      
      public var txt_vip:Label = null;
      
      public var txt_vip2:Label = null;
      
      public function FSignInRenderUI()
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
