package game.ui.guildDungeon.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.RadioButton;
   import morn.core.components.List;
   import morn.core.components.Image;
   import game.ui.commons.icons.WealthRenderS3UI;
   
   public class GuildDungeonTargetRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="280" height="100">
			  <Label text="label" x="-11" y="54" width="75" height="18" var="txt_chapterName" style="普通说明" align="center"/>
			  <Label text="\l40710506" x="58" y="19" width="106" height="18" style="普通说明"/>
			  <RadioButton y="17" style="Radio普通" var="radio_target" selected="false" x="240.5"/>
			  <Label text="推荐战斗力" x="58" y="0" width="166" height="21" var="txt_fightValue" style="普通说明" align="left"/>
			  <List x="59" y="39" repeatX="4" var="list_drops" spaceX="-15">
			    <WealthRenderS3 scale="0.6" name="render" runtime="game.ui.commons.icons.WealthRenderS3UI"/>
			  </List>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="0" y="0" var="img_quality" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="3" y="3" var="img_icon" width="44" height="44"/>
			  <Label text="条件" x="219" y="15" width="63" height="64" var="txt_condi" style="不足禁止红" wordWrap="true" align="center"/>
			  <Label text="\l40710507" x="196" y="40" width="110" height="21" style="普通说明" align="center" var="radioTxt"/>
			</View>;
       
      
      public var txt_chapterName:Label = null;
      
      public var radio_target:RadioButton = null;
      
      public var txt_fightValue:Label = null;
      
      public var list_drops:List = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_condi:Label = null;
      
      public var radioTxt:Label = null;
      
      public function GuildDungeonTargetRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS3UI"] = WealthRenderS3UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
