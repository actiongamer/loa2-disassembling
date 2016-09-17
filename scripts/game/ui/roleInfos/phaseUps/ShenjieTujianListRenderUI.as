package game.ui.roleInfos.phaseUps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.props.RolePropBaseRenderS2UI;
   
   public class ShenjieTujianListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="295" height="337">
			  <Image skin="png.a5.commonImgs.img_yellow" x="71" y="-7"/>
			  <Image skin="png.a5.commonImgs.img_yellow" x="71" y="105"/>
			  <Label text="【1阶】" autoSize="none" x="0.5" y="-1" color="0xeac472" width="294" height="18" align="center" bold="true" var="txt_phaseName"/>
			  <List x="-1" y="142" repeatY="3" spaceY="13" var="list_skill" width="294" height="202">
			    <SkillShowRender name="render" runtime="game.ui.roleInfos.phaseUps.SkillShowRenderUI"/>
			  </List>
			  <List x="1" y="46" repeatX="2" repeatY="3" var="list_prop" spaceX="50">
			    <RolePropBaseRenderS2 name="render" x="0" y="0" runtime="game.ui.commons.props.RolePropBaseRenderS2UI"/>
			  </List>
			  <Label text="属性" autoSize="none" x="67" y="24" color="0xeac472" width="163" height="18" align="center"/>
			  <Label text="技能描述" autoSize="none" x="67" y="111" color="0xeac472" width="163" height="18" align="center"/>
			</View>;
       
      
      public var txt_phaseName:Label = null;
      
      public var list_skill:List = null;
      
      public var list_prop:List = null;
      
      public function ShenjieTujianListRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.props.RolePropBaseRenderS2UI"] = RolePropBaseRenderS2UI;
         viewClassMap["game.ui.roleInfos.phaseUps.SkillShowRenderUI"] = SkillShowRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
