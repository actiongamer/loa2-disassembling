package game.ui.fashionAcc
{
   import morn.customs.components.PopModuleView;
   
   public class FashionAccSkillWindowUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="371" height="292">
			  <PanelBgS3 width="369" height="290" bgStyle="1" showTabLine="false" frameVisible="true" frameStyle="2" x="0" y="0"/>
			  <Image skin="png.uiSkillChange.img_splitLine" x="25" y="160" width="320"/>
			  <FashionAccSkillRender x="18" y="45" var="skill1" runtime="game.ui.fashionAcc.FashionAccSkillRenderUI"/>
			  <FashionAccSkillRender x="18" y="168" var="skill2" runtime="game.ui.fashionAcc.FashionAccSkillRenderUI"/>
			</PopModuleView>;
       
      
      public var skill1:game.ui.fashionAcc.FashionAccSkillRenderUI = null;
      
      public var skill2:game.ui.fashionAcc.FashionAccSkillRenderUI = null;
      
      public function FashionAccSkillWindowUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.fashionAcc.FashionAccSkillRenderUI"] = game.ui.fashionAcc.FashionAccSkillRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
