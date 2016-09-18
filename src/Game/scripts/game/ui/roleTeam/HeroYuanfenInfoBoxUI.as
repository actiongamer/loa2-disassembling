package game.ui.roleTeam
{
   import morn.core.components.View;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.roleTeam.render.YuanFenDetailRenderUI;
   
   public class HeroYuanfenInfoBoxUI extends View
   {
      
      protected static var uiView:XML = <View width="218.5" height="122">
			  <Image skin="png.uiRoleTeam.黄底 2" x="53" y="1"/>
			  <List x="7.5" y="14" var="list_yuanfen" spaceY="8">
			    <YuanFenDetailRender name="render" runtime="game.ui.roleTeam.render.YuanFenDetailRenderUI"/>
			  </List>
			  <Label text="捍地金刚" x="65" y="4" width="149" height="18" underline="false" selectable="false" buttonMode="true" var="txt_heroName" autoSize="none" style="人名2不随品质变化" align="center" bold="true"/>
			</View>;
       
      
      public var list_yuanfen:List = null;
      
      public var txt_heroName:Label = null;
      
      public function HeroYuanfenInfoBoxUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleTeam.render.YuanFenDetailRenderUI"] = YuanFenDetailRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
