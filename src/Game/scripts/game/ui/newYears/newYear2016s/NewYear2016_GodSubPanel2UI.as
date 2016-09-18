package game.ui.newYears.newYear2016s
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import morn.core.components.List;
   
   public class NewYear2016_GodSubPanel2UI extends View
   {
      
      protected static var uiView:XML = <View width="500" height="400">
			  <Image skin="png.uiNewYear2016.subPanels.img_line1" x="245" y="5"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_Bg2" x="0" y="125" alpha="0.5"/>
			  <Label text="当前放鞭炮点数" autoSize="none" x="17" y="46" style="渐变2" width="294" height="76" var="txt_tip1" multiline="true" wordWrap="true"/>
			  <ClipList value="1234" clipWidth="35" align="left" url="png.uiNewYear2016.subPanels.clipList_val" x="339" y="71" var="num_total"/>
			  <Image skin="png.uiNewYear2016.subPanels.img_txt1" x="349" y="44"/>
			  <List x="9" y="134" repeatY="4" spaceY="1" var="list_reward" width="497" height="358">
			    <NewYear2016_GodSubPanel2Render name="render" runtime="game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2RenderUI"/>
			  </List>
			</View>;
       
      
      public var txt_tip1:Label = null;
      
      public var num_total:ClipList = null;
      
      public var list_reward:List = null;
      
      public function NewYear2016_GodSubPanel2UI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.newYears.newYear2016s.NewYear2016_GodSubPanel2RenderUI"] = NewYear2016_GodSubPanel2RenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
