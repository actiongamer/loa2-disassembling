package nslm2.modules.foundations.fourteenDays.vo
{
   import nslm2.mgrs.stcMgrs.vos.Stc14DayTaskVo;
   import proto.FourteenDayLoginInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   
   public class FourteenDaysVo
   {
       
      
      public var id:int;
      
      public var titleId:int;
      
      public var content:int;
      
      public var loginBonusStatus:Boolean;
      
      public var buyArr:Array;
      
      private var _sdStcVO:Stc14DayTaskVo;
      
      public function FourteenDaysVo(param1:int)
      {
         super();
         id = param1;
      }
      
      public function updateInfo(param1:*) : void
      {
         if(param1 as FourteenDayLoginInfo)
         {
            loginBonusStatus = (param1 as FourteenDayLoginInfo).status;
         }
         else if(param1 as Array)
         {
            buyArr = param1 as Array;
         }
      }
      
      public function get sdStcVO() : Stc14DayTaskVo
      {
         if(!_sdStcVO)
         {
            _sdStcVO = StcMgr.ins.get14DayTaskVo(id + 1);
         }
         return _sdStcVO;
      }
   }
}
