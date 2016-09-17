package game.ui.familyBosses
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.List;
   import morn.core.components.Button;
   import game.ui.familyBosses.render.FamilyBossDmgRewardRenderUI;
   
   public class FamilyBossDamageRewardModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="404" height="530">
			  <PanelBgS3 width="402" height="532" showLightBottom="true" frameStyle="1" frameVisible="true" x="0" y="0"/>
			  <List x="19" y="42" repeatY="5" spaceY="1" vScrollBarSkin="png.a5.comps.scrollBar.vscroll_S3" width="365" height="422" var="list_reward">
			    <FamilyBossDmgRewardRender name="render" runtime="game.ui.familyBosses.render.FamilyBossDmgRewardRenderUI"/>
			  </List>
			  <Button label="\l10700003" x="142.5" style="按钮大绿" y="481" centerX="0" var="btn_autoGet"/>
			</PopModuleView>;
       
      
      public var list_reward:List = null;
      
      public var btn_autoGet:Button = null;
      
      public function FamilyBossDamageRewardModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.familyBosses.render.FamilyBossDmgRewardRenderUI"] = FamilyBossDmgRewardRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
