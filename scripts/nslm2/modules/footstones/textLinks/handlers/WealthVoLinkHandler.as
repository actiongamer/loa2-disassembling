package nslm2.modules.footstones.textLinks.handlers
{
   import nslm2.utils.WealthUtil;
   import nslm2.common.vo.WealthVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class WealthVoLinkHandler extends LinkHandlerBase
   {
       
      
      public function WealthVoLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         var _loc1_:WealthVo = WealthUtil.parseCostStr(this.evtContent[0]);
         ObserverMgr.ins.sendNotice("msg_tooltip_click",_loc1_);
      }
   }
}
