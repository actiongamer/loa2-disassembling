package game.ui.roleTeam.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   
   public class YuanFenDetailRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="243" height="69">
			  <Image skin="png.a5.bgs.panelBgs.img_YuanfenBg"/>
			  <Label text="大地精灵" autoSize="left" x="4" y="4" style="随品质变化" height="18" var="txt_name"/>
			  <Label text="随品质变化" autoSize="left" x="140" y="27" style="随品质变化" height="18" var="txt_des1"/>
			  <List x="6" y="24" repeatX="3" spaceX="4" var="list_item">
			    <YuanFenItemRender name="render" buttonMode="true" runtime="game.ui.roleTeam.render.YuanFenItemRenderUI"/>
			  </List>
			  <Label text="随品质变化" autoSize="left" x="140" y="45" style="随品质变化" height="18" var="txt_des2"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public var txt_des1:Label = null;
      
      public var list_item:List = null;
      
      public var txt_des2:Label = null;
      
      public function YuanFenDetailRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.roleTeam.render.YuanFenItemRenderUI"] = YuanFenItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
