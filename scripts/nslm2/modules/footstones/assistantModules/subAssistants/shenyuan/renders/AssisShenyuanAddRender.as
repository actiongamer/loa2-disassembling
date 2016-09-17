package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.renders
{
   import game.ui.assistantModules.renders.AssisShenyuanAddRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import morn.core.components.Button;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssisShenyuanUtils;
   import morn.customs.expands.MornExpandUtil;
   
   public class AssisShenyuanAddRender extends AssisShenyuanAddRenderUI
   {
       
      
      public function AssisShenyuanAddRender()
      {
         super();
         MornExpandUtil.addHandlerForBtnAll(this,onBtnFunc);
      }
      
      private function get vo() : StcBuffVo
      {
         return StcMgr.ins.getBuffVo(int(this.dataSource)) as StcBuffVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_buffName.text = LocaleMgr.ins.getStr(this.vo.name) + LocaleMgr.ins.getStr(999000827);
            this.btn_add.visible = true;
         }
         else
         {
            this.txt_buffName.text = "";
            this.btn_add.visible = false;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_add === _loc2_)
         {
            AssisShenyuanUtils.addNeedBuyBuffId(int(this.dataSource));
         }
      }
   }
}
