package nslm2.modules.cultivates.reinforceTrain.render
{
   import game.ui.reinforceTrain.ReinforcePropRenderUI;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.common.consts.NPCPropConsts;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ReinforcePropRender extends ReinforcePropRenderUI
   {
       
      
      public function ReinforcePropRender()
      {
         super();
      }
      
      override public function get vo() : NpcPropVo
      {
         return dataSource as NpcPropVo;
      }
      
      override public function set dataSource(param1:Object) : void
      {
         .super.dataSource = param1;
         if(vo)
         {
            this.txt_name.text = NPCPropConsts.ins.getLocaleName(vo.propId) + "：";
         }
      }
      
      override public function floatCpl(param1:*, param2:*) : void
      {
         ObserverMgr.ins.sendNotice("float_cpl");
         super.floatCpl(param1,param2);
      }
   }
}
