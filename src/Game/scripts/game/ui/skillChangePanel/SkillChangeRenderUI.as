package game.ui.skillChangePanel
{
   import morn.customs.components.PanelView;
   import game.ui.commons.icons.SkillRenderS9UI;
   import morn.core.components.Label;
   import morn.core.components.Image;
   
   public class SkillChangeRenderUI extends PanelView
   {
      
      protected static var uiView:XML = <PanelView width="56" height="77" buttonMode="true">
			  <SkillRenderS9 var="skillRender" x="-1" y="0" runtime="game.ui.commons.icons.SkillRenderS9UI"/>
			  <Label x="10.5" y="1" var="txt_using" visible="true" mouseEnabled="false" align="center" style="重要提示绿" text="\l10000014"/>
			  <Image skin="png.a5.commonImgs.新获得" x="24" y="-2" var="img_new"/>
			</PanelView>;
       
      
      public var skillRender:SkillRenderS9UI = null;
      
      public var txt_using:Label = null;
      
      public var img_new:Image = null;
      
      public function SkillChangeRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.SkillRenderS9UI"] = SkillRenderS9UI;
         super.createChildren();
         createView(uiView);
      }
   }
}
