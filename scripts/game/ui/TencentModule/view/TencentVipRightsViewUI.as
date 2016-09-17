package game.ui.TencentModule.view
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.TencentModule.render.TencentVipRightsRenderUI;
   
   public class TencentVipRightsViewUI extends View
   {
      
      protected static var uiView:XML = <View width="600" height="400">
			  <List x="5" y="107" repeatX="2" spaceX="1" repeatY="3" spaceY="1" width="584" height="390" var="list_img">
			    <TencentVipRightsRender name="render" runtime="game.ui.TencentModule.render.TencentVipRightsRenderUI"/>
			  </List>
			  <Image skin="png.a5.comps.img_block" x="18" y="147" var="img_desc1" width="179" height="39"/>
			  <Image skin="png.a5.comps.img_block" x="308" y="145" var="img_desc2" width="204" height="67"/>
			  <Image skin="png.a5.comps.img_block" x="18" y="274" var="img_desc3" width="201" height="72"/>
			  <Image skin="png.a5.comps.img_block" x="308" y="274" var="img_desc4" width="179" height="39"/>
			  <Image skin="png.a5.comps.img_block" x="18" y="399" var="img_desc5" width="201" height="72"/>
			  <Image skin="png.a5.comps.img_block" x="308" y="400" var="img_desc6" width="178" height="40"/>
			</View>;
       
      
      public var list_img:List = null;
      
      public var img_desc1:Image = null;
      
      public var img_desc2:Image = null;
      
      public var img_desc3:Image = null;
      
      public var img_desc4:Image = null;
      
      public var img_desc5:Image = null;
      
      public var img_desc6:Image = null;
      
      public function TencentVipRightsViewUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.TencentModule.render.TencentVipRightsRenderUI"] = TencentVipRightsRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
