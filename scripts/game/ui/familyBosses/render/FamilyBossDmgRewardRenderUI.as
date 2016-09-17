package game.ui.familyBosses.render
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   import morn.core.components.List;
   import game.ui.commons.icons.WealthRenderS56UI;
   
   public class FamilyBossDmgRewardRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="346" height="84">
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5" x="2" y="1" width="344" height="80" sizeGrid="20,20,20,40"/>
			  <Image skin="png.a5.bgs.listRenderBgs.renderBgS5Selected" x="-1" y="-2" width="350" height="87" sizeGrid="20,20,20,20" var="img_selected" mouseEnabled="false" mouseChildren="false"/>
			  <Label text="普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明普通说明" autoSize="left" x="78" y="20" style="普通说明" var="txt_condition" width="264" height="20"/>
			  <Label text="\l40740062" autoSize="left" x="78" y="42" style="普通说明"/>
			  <Label text="进度：" autoSize="left" x="118" y="42" style="普通说明" height="20" var="txt_progress" language="en" lgy="42,42" lgx="140,118"/>
			  <Button label="\l10700007" x="254" y="47" style="按钮中绿" var="btn_get"/>
			  <Image skin="png.a5.commonImgs.img_gotReward" x="302" y="40" var="img_got" anchorX=".5" anchorY=".5"/>
			  <List x="10" y="11" var="list_rwd">
			    <WealthRenderS56 name="render" runtime="game.ui.commons.icons.WealthRenderS56UI"/>
			  </List>
			</View>;
       
      
      public var img_selected:Image = null;
      
      public var txt_condition:Label = null;
      
      public var txt_progress:Label = null;
      
      public var btn_get:Button = null;
      
      public var img_got:Image = null;
      
      public var list_rwd:List = null;
      
      public function FamilyBossDmgRewardRenderUI()
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
