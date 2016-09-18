package nslm2.modules.funnies.dials.vos
{
   import proto.StaticZhuanPanRewardModel;
   
   public class DialRewardVo
   {
      
      public static const RANK:String = "rank";
       
      
      public var rank:int;
      
      public var data:StaticZhuanPanRewardModel;
      
      public function DialRewardVo(param1:int, param2:StaticZhuanPanRewardModel)
      {
         super();
         rank = param1;
         data = param2;
      }
   }
}
