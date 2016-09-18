package game.ui.equipGrows.upStars
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class EquipUpStarMannalRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="339" height="128">
			  <Image skin="png.uiEquipGrow.upstar.装备-升星-天赋bj" x="0" y="0"/>
			  <Label text="升星" autoSize="none" x="10" y="8" style="普通说明" var="label_star" width="104" height="19"/>
			  <Label text="攻击" autoSize="none" x="10" y="28" style="普通说明" var="label_buff" width="330" height="19"/>
			  <Label text="突破需求" autoSize="none" x="10" y="48" style="普通说明" var="label_need" width="330" height="19"/>
			  <List y="8" repeatX="3" spaceX="-5" var="list_stars" scale="0.5" x="272">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <List x="13" y="70" var="list_need" spaceX="30">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <Label text="\l999900110" autoSize="none" x="70" y="100" style="普通说明" var="label_or_0"/>
			  <Label text="\l999900110" autoSize="none" x="150" y="100" style="普通说明" var="label_or_1"/>
			</View>;
       
      
      public var label_star:Label = null;
      
      public var label_buff:Label = null;
      
      public var label_need:Label = null;
      
      public var list_stars:List = null;
      
      public var list_need:List = null;
      
      public var label_or_0:Label = null;
      
      public var label_or_1:Label = null;
      
      public function EquipUpStarMannalRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
