package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class StcItemLinkHandler extends LinkHandlerBase
   {
       
      
      public function StcItemLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:StcItemVo = StcMgr.ins.getItemVo(this.evtContent[0]);
         ObserverMgr.ins.sendNotice("msg_tooltip_click",_loc1_);
      }
   }
}
