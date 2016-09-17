package game.ui.TencentModule.render
{
   import morn.core.components.View;
   import morn.core.components.Button;
   import morn.core.components.Image;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS15UI;
   
   public class TencentVipRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="339" height="30">
			  <Button skin="png.uiTencent.领取" x="280" y="6" stateNum="1" var="btn_get"/>
			  <Image skin="png.a5.comps.img_block" y="10" x="25" var="img_vipLvl" width="25" height="19" autoSize="true"/>
			  <List x="72" width="188" height="25" repeatX="3" spaceX="20" y="4" var="list_reward">
			    <WealthRenderS15 name="render" runtime="game.ui.commons.icons.WealthRenderS15UI"/>
			  </List>
			  <Image skin="png.a5.commonImgs.分割线" y="0" width="339" x="0"/>
			</View>;
       
      
      public var btn_get:Button = null;
      
      public var img_vipLvl:Image = null;
      
      public var list_reward:List = null;
      
      public function TencentVipRewardRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS15UI"] = WealthRenderS15UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
