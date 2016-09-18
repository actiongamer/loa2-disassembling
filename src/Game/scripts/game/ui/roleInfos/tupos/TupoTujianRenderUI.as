package game.ui.roleInfos.tupos
{
   import morn.core.components.View;
   import morn.core.components.Label;
   import morn.core.components.List;
   import game.ui.commons.icons.SkillRenderS5UI;
   import game.ui.commons.icons.WealthRenderS5UI;
   
   public class TupoTujianRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="317" height="119">
			  <Image skin="png.uiRoleInfo.tupo.img_tujianBg" x="-1" y="0"/>
			  <Label text="突破+1激活" x="17" y="5" style="普通说明" width="294" var="txt_activate"/>
			  <Label text="突破增益" x="17" y="23" style="普通说明" width="294" var="txt_addProp"/>
			  <Label text="突破需要：" x="17" y="41" style="普通说明" width="99"/>
			  <List x="17" y="61" repeatX="5" spaceX="8" var="list_needItem">
			    <WealthRenderS5 name="render" runtime="game.ui.commons.icons.WealthRenderS5UI"/>
			  </List>
			  <SkillRenderS5 x="208" y="14" var="render_unlockSkill" runtime="game.ui.commons.icons.SkillRenderS5UI"/>
			</View>;
       
      
      public var txt_activate:Label = null;
      
      public var txt_addProp:Label = null;
      
      public var list_needItem:List = null;
      
      public var render_unlockSkill:SkillRenderS5UI = null;
      
      public function TupoTujianRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS5UI"] = SkillRenderS5UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS5UI"] = WealthRenderS5UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
