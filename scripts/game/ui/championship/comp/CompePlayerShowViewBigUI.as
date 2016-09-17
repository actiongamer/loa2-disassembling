package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Box;
   
   public class CompePlayerShowViewBigUI extends View
   {
      
      protected static var uiView:XML = <View width="307" height="364">
			  <PlayerListRender x="82" y="35" var="nameRender" runtime="game.ui.championship.comp.PlayerListRenderUI"/>
			  <Box x="12" y="111" var="box_empty">
			    <Image skin="png.uiChampionship.人物剪影-小" smoothing="true"/>
			    <Label text="总冠军" autoSize="none" x="76" y="100" style="随品质变化" width="112" height="49" align="center"/>
			  </Box>
			</View>;
       
      
      public var nameRender:game.ui.championship.comp.PlayerListRenderUI = null;
      
      public var box_empty:Box = null;
      
      public function CompePlayerShowViewBigUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.championship.comp.PlayerListRenderUI"] = game.ui.championship.comp.PlayerListRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
