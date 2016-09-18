package nslm2.modules.footstones.textLinks.handlers
{
   import com.mz.core.mgrs.ObserverMgr;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class StcHeroLinkHandler extends LinkHandlerBase
   {
       
      
      private var _stcNpcId:int;
      
      public function StcHeroLinkHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         super.exec();
         ObserverMgr.ins.sendNotice("msg_tooltip_click",StcMgr.ins.getNpcVo(stcNpcId));
      }
      
      public function get stcNpcId() : int
      {
         if(_stcNpcId == 0)
         {
            _stcNpcId = int(this.evtContent[0]);
         }
         return _stcNpcId;
      }
   }
}
