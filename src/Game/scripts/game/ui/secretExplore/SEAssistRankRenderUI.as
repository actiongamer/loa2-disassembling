package game.ui.secretExplore
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class SEAssistRankRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="418" height="46">
			  <Image skin="png.a5.commonImgs.rank.img_crown1" x="3" y="16" var="img_rank"/>
			  <Label text="99" autoSize="none" x="2" y="18" style="普通说明" width="29" height="20" align="center" var="txt_rank"/>
			  <List x="282" y="3" repeatX="4" scaleX=".8" scaleY=".8" var="item0">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="99" autoSize="none" x="47" y="18" style="普通说明" width="101" height="20" align="center" var="txt_name"/>
			  <Label text="99" autoSize="none" x="182" y="18" style="普通说明" width="52" height="20" align="center" var="txt_times"/>
			  <Image skin="png.a5.commonImgs.分割线" x="2" y="45"/>
			</View>;
       
      
      public var img_rank:Image = null;
      
      public var txt_rank:Label = null;
      
      public var item0:List = null;
      
      public var txt_name:Label = null;
      
      public var txt_times:Label = null;
      
      public function SEAssistRankRenderUI()
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
