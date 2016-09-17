package game.ui.recycleModules.heroRecycle
{
   import morn.core.components.View;
   import morn.core.components.List;
   import game.ui.recycleModules.render.RecycleItemRenderUI;
   
   public class HeroRecyclePanelUI extends View
   {
      
      protected static var uiView:XML = <View width="779" height="476">
			  <Image skin="jpg.uiRecycle.heroBg" height="476" width="779"/>
			  <List x="144" y="45" var="list_heros">
			    <RecycleItemRender y="97" name="item3" x="0" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="192" y="175" name="item0" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="373" y="100" name="item4" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="282" name="item2" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			    <RecycleItemRender x="91" name="item1" runtime="game.ui.recycleModules.render.RecycleItemRenderUI"/>
			  </List>
			</View>;
       
      
      public var list_heros:List = null;
      
      public function HeroRecyclePanelUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.recycleModules.render.RecycleItemRenderUI"] = RecycleItemRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
