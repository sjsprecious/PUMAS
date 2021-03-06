! *****************************COPYRIGHT*******************************
! (C) Crown copyright Met Office. All rights reserved.
! For further details please refer to the file COPYRIGHT.txt
! which you should have received as part of this distribution.
! *****************************COPYRIGHT*******************************
!
! Module to interface with choice of microphysics schemes
!

module mphys_interface

  Use mphys_thompson07, only: mphys_thompson07_interface
  Use mphys_thompson09, only: mphys_thompson09_interface
  Use mphys_morr_two_moment, only: mphys_morrison_interface
  Use mphys_mg1_5, only: mphys_mg1_5_interface
  Use mphys_mg2, only: mphys_mg2_interface
  Use mphys_mg3, only: mphys_mg3_interface
  Use mphys_tau_bin, only: mphys_tau_bin_interface
#if UM_MICRO ==1
  Use mphys_um7_3, only: mphys_um7_3_interface
#endif
#if SHIPWAY_MICRO == 1
  Use mphys_4A, only: mphys_4A_interface
#endif
  Use switches

contains

  subroutine mphys_column(scheme_id)
    
    integer, intent(in) :: scheme_id

    select case (scheme_id)
   case(imphys_thompson09) ! Greg Thompson's mphys scheme
       call mphys_thompson09_interface
    case(imphys_thompson07) ! Greg Thompson's mphys scheme
       call mphys_thompson07_interface
    case(imphys_morr_two_moment) ! Hugh Morrisons's mphys scheme
       call mphys_morrison_interface
    case(imphys_mg1_5) ! Morrison Gettelman version 1.5
       call mphys_mg1_5_interface
    case(imphys_mg2) ! Morrison Gettelman version 2
       call mphys_mg2_interface
    case(imphys_mg3) ! Morrison Gettelman version 2
       call mphys_mg3_interface
#if UM_MICRO == 1 
    case(imphys_um7_3)      ! mphys scheme from um version 7.3
       call mphys_um7_3_interface
#endif
    case(imphys_tau_bin)    ! TAU bin mphys scheme
       call mphys_tau_bin_interface
#if SHIPWAY_MICRO == 1
    case(imphys_4A)         ! Shipway 4A scheme
       call mphys_4A_interface
#endif
    end select

  end subroutine mphys_column

end module mphys_interface

