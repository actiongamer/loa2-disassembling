package game.ui.tooltipModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import game.ui.commons.props.FightValueBoxUI;
   import morn.core.components.List;
   import game.ui.commons.comps.others.EquipStarRenderUI;
   
   public class TooltipIconAndName_petUI extends View
   {
      
      protected static var uiView:XML = <View width="261" height="90">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_3" x="15" y="-1" var="img_quality" width="58" height="58" sizeGrid="8,8,8,8"/>
			  <Image skin="png.a5.comps.img_block" x="18" y="2" width="52" height="52" var="img_icon"/>
			  <Label text="名称" autoSize="none" x="79" y="-2" bold="false" size="14" var="txt_name" align="left" width="130" height="20" style="随品质变化"/>
			  <FightValueBox x="80" y="38" var="fightValueBox" runtime="game.ui.commons.props.FightValueBoxUI"/>
			  <Label text="等级：" autoSize="none" x="79" y="19" bold="false" size="12" var="txt_lvl" align="left" width="74" height="19" style="重要提示橘黄"/>
			  <Label text="等级：" autoSize="none" x="170" y="19" bold="false" size="12" var="txt_grade" align="left" width="74" height="19" style="重要提示橘黄"/>
			  <List x="10" y="61" repeatX="15" var="list_stars" scale="0.5" spaceX="-6">
			    <EquipStarRender name="render" runtime="game.ui.commons.comps.others.EquipStarRenderUI"/>
			  </List>
			  <Label text="类型" autoSize="none" x="190" y="-2" bold="false" var="txt_kind" size="12" width="69" align="right" style="普通说明" height="20"/>
			</View>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var fightValueBox:FightValueBoxUI = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_grade:Label = null;
      
      public var list_stars:List = null;
      
      public var txt_kind:Label = null;
      
      public function TooltipIconAndName_petUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.comps.others.EquipStarRenderUI"] = EquipStarRenderUI;
         viewClassMap["game.ui.commons.props.FightValueBoxUI"] = FightValueBoxUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
