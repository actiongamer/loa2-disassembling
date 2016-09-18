package game.ui.teamGuajiScenes.rank
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class guajiRankingRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="651" height="58">
			  <Label text="1" autoSize="none" x="22" y="24" style="人名1不随品质变化" width="104" height="22" align="center" var="txt_rank"/>
			  <Label text="女法师" autoSize="none" x="193" y="23" style="普通说明" width="104" height="22" align="center" var="txt_name"/>
			  <Label text="123" autoSize="none" x="382" y="23" style="人名1不随品质变化" width="104" height="22" align="center" var="txt_cnt"/>
			  <Image skin="png.a5.commonImgs.1ST" x="76" y="42" anchorX=".5" anchorY="1" var="img_rank"/>
			  <List x="568" y="4" var="rwdList" repeatX="4" spaceX="3">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			</View>;
       
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_cnt:Label = null;
      
      public var img_rank:Image = null;
      
      public var rwdList:List = null;
      
      public function guajiRankingRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
