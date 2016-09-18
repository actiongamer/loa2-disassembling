package game.ui.arenas.scores
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.List;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class ArenaScoreRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="412" height="80">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5" x="78" y="-2" sizeGrid="16,16,16,16" width="335" height="83"/>
			  <Image skin="png.uiArenas.scores.已领取" x="321" y="2" var="have_got"/>
			  <Button label="领  取" x="318" y="26" style="按钮中绿" var="btn_get"/>
			  <List x="86" y="14" var="list_reward" repeatX="4" spaceX="2">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			  <Image skin="png.uiArenas.scores.线" x="32" y="-16" var="image_line"/>
			  <Image skin="png.uiArenas.scores.底框" x="6" y="6" var="image_icon"/>
			  <Label text="label" x="11" y="29" style="渐变1" font="微软雅黑" size="20" width="55" height="31" align="center" var="num_label"/>
			  <Label text="\l50200008" autoSize="none" x="90" y="22" style="普通说明" width="301" height="39" var="txt_tip" multiline="true" visible="false"/>
			</View>;
       
      
      public var have_got:Image = null;
      
      public var btn_get:Button = null;
      
      public var list_reward:List = null;
      
      public var image_line:Image = null;
      
      public var image_icon:Image = null;
      
      public var num_label:Label = null;
      
      public var txt_tip:Label = null;
      
      public function ArenaScoreRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS56UI"] = WealthRenderS56UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
