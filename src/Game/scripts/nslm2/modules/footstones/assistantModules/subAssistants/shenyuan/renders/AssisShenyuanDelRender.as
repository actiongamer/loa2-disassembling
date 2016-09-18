package nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.renders
{
   import game.ui.assistantModules.renders.AssisShenyuanDelRenderUI;
   import nslm2.mgrs.stcMgrs.vos.StcBuffVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.assistantModules.subAssistants.shenyuan.AssisShenyuanUtils;
   import morn.core.components.Button;
   import com.mz.core.mgrs.ObserverMgr;
   import morn.customs.expands.MornExpandUtil;
   
   public class AssisShenyuanDelRender extends AssisShenyuanDelRenderUI
   {
       
      
      public function AssisShenyuanDelRender()
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
         var _loc2_:* = null;
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_buffName.text = LocaleMgr.ins.getStr(this.vo.name);
            _loc2_ = AssisShenyuanUtils.tempNeedBuyBuffArr;
            this.txt_sort.num = _loc2_.indexOf(int(this.dataSource)) + 1;
         }
      }
      
      private function onBtnFunc(param1:Button) : void
      {
         var _loc2_:* = param1;
         if(this.btn_delete === _loc2_)
         {
            AssisShenyuanUtils.removeNeedBuyBuffId(int(this.dataSource));
            ObserverMgr.ins.sendNotice("shenyuanBuffChanged");
         }
      }
   }
}
