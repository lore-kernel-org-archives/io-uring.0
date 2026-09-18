Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD1A519E17
	for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750211; cv=pass; b=G67luFOCYWBO7iD3aofaNBJyElov2WEPNkynfmhLGpnDLh6KfdhmSX3BnuvEbdI0WShTPdSTJNsIedoSodHwterRg2nJywaxpWo2OCLCxX2OigD6J+JFoNKljb6AZK8XtthDsZcfgYgJn+MzNAmgEmHU6d3kiQDsaCncL7PljgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750211; c=relaxed/simple;
	bh=61CZRYVw4UNK4aA4hW8ZoCKVkj8SieSzYg+GSu+LnJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kFbNE7RBrko1ZFgH5t4ovbARO3V/bjdR2FlHCZBLgX8gpe70beNO2gi35y/TvAEgM78Ogoe3dD39qmksYDh0mztmBjJeFbOYr0yR/SVBxD0YilxSLym1COWg4O/xP/4LE3hRu3T+wzMV7XUEXLY8AUSAER4Mvpfp3vVROB2q+MY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=pass smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=JPtLUxT2; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="JPtLUxT2"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46435ddf8a0so36372fac.2
        for <io-uring@vger.kernel.org>; Fri, 18 Sep 2026 09:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789750204; cv=none;
        d=google.com; s=arc-20260327;
        b=E3fHzoyooaZsyefMzte69DYRsRGFwfsEpXYk2GUnJ+7CxE17HaG99PBh1UyeaJFKgz
         3ZWehU3Al6P+xBvXSgB2GSzHUi5JYa4b1I5KGKk9taZzTqDrJ7mDYtKIlXizi7BKjAox
         HoauVh3MHtZQjWmQxCRuz/I1UiMhG8arabwQkXcl3l0YJzqE+MenwNUk3Kzblmvt2fzy
         pXiOi386fGzmjOxCbIQDYDZsUbwOQGDSfIsXJm08TkRgSnWzBpk0jpuN0E5jFrvAxVBj
         VXVzA158Qs/r5eMRc7a+a4vKZGFbCH9B5pAYVcpspaFf5DVD671cJNyY3CrBfnfY2xMA
         mevQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4lwj80uYQ2h78lU8lF12fwnGXbBXyM0nOUjeYld0ywo=;
        fh=s0BTzgTX3lvZ671IdOukjHmysAykK5ySVbjJK8BOjh0=;
        b=BKem1vo3XUnR2CbuXlpEFC9oUFCm0H9QCMR8k8aDiACHZ1Jz9hn3TYvIDwCdaqm4+/
         rflYO5r/Jb0nsuf/y1JMtuK8+nTfBzv9xK5YQB49NTxgmZOkMK97xgf8IXHMVHINtm4r
         IuJeMW0dXWln/udw5awcrw2ine8vJB3FcER5BgAYyEj+jtpXttOGK5BrCA5pjLwIEZRs
         wG80gLedgLH1F8vxh12J0kIDZ4h/9RaGufb5U7EX/cO5/Zvs3EdRdUc4aCu0NfkC8Hoi
         pejPyaxeqS4QW8+p0reeMtPTLaw0fbEscK3cvvlc4zG2IYlHP6uQfuekxUCS3kFcqdhf
         Q1pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1789750204; x=1790355004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lwj80uYQ2h78lU8lF12fwnGXbBXyM0nOUjeYld0ywo=;
        b=JPtLUxT2MjkTw3o5X004rC3IBcaaeYJPrugpO0l+Kdj0GNLiJM0r9j1yim1Ann2nmK
         S7PZGEpYYcFRoEn64ZT4O/8DtlbF//RDKKvf4fcunU4wDrFfz0RZe16zM3hh7NESVZqO
         HGs+PuMIfh1sFjdkWaQ3k3URblyhdDx234Qmro9nbnM/p72AxuSLgBWzzjz2e6ZB/cfB
         0hiVFlUS9IiH6ySgvB1mQhntVDmXSoVEHB/rJtxOzZAFFyj6O0SjSXNSCd+qq11xDY6/
         KYH2CX0/Wpm0A6c4sgZYWQ2Jr6ZkrpM4V+PMChfX7o7WIGFuusCADl+NorQyJaXu4urn
         jJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750204; x=1790355004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lwj80uYQ2h78lU8lF12fwnGXbBXyM0nOUjeYld0ywo=;
        b=2wFFXPS1lZsZjbrDcPStrDxns4cuDa1swuymm3j4I3Q35p86vETzjl13M1ZYX6DXSb
         2yVIuDwAcSsyYIWnJ5Vh7xYbgDsG91n1JFvAspvKVkqoyrTC8haLV9pq1PEm0Aaf4QDz
         bhDxDUxESD2B/xd3Y5M+2KaQxcHUMGfhXz1+wYX1dTAzyHPmL8jgjGw+m2uSPXPid6Ak
         FFIoy2Dj1z26qPE1twI9PqopdLAwnfKA/RxR/aPj8KJpiOALsgrLmvTd5kdUaWg3s8aL
         UrmJ5VpltTQ46+Ou+VIDX32OvMoOJgq8cRtqUFRr1zbJUxUs5P5djbK7T5rdpI100jv4
         aBdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzcgCsFIq+G0JXXG1GDHRhn/dldoSNcoGSL70fKay0nkyreDIad+ql+H3gWUhO9U4lQ0vo4OP77zQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kpt1BjMcaUwPXfKmdKECdeHI47FGvCuurzHIwfEAEkbkvmG86Y
	AJ2/ns17nP4HRMRnQHK6kqjSSBIUYVxjOkWliYTDXjpPPo77x9UcP4rrO62KiP+U/vQsbYJ/PO+
	VVnlvsPXa0BIUKykXwc+k24hGeGjqRz5NwF2pU2wetut/kvR0TkruJB4=
X-Gm-Gg: AYBFou0W8l+wfQMv77jnow0FWbW44TKE+TlAnWLsZHFkoZuvBS6nkz5iCYwDqpmRjOm
	BjCuVAjYt2hAHdQ8UDhfowOOLtYsAKDBtkueBmvUzKVXC8NzGoQrP4Ox3SYTu0r79TXwJqfV8Gx
	leM07okoEOZqld3YyVIezHllBSRVsyzfwCSRXM0UfJ9munPq3JoqnAd2NNiG9qjiosALG9dQPKo
	FXh+HHnmRwroszzpL06g5v13xMADo4IY/HrYW/Fm2mFMmO8W6LhUhzI1WogFvmpxHuY4qn5Xkku
	yXtB++owxa7ITZMZaOLKk1swo5gIKPT3So6NN3ZPiNFJ5oUqLklPw32eTwWLPUrR+wA=
X-Received: by 2002:a05:6871:728f:b0:41c:bea3:236d with SMTP id
 586e51a60fabf-4872ca35d19mr2424926fac.1.1789750203956; Fri, 18 Sep 2026
 09:50:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918090010.1688-1-aditya.ansh182@gmail.com> <20260918090010.1688-2-aditya.ansh182@gmail.com>
In-Reply-To: <20260918090010.1688-2-aditya.ansh182@gmail.com>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 18 Sep 2026 09:49:53 -0700
X-Gm-Features: AcwNN1VmlwytNBOTF42IVuXVfs_ELj2HhLFd0sOyQMhEtsQzB1nccN9lkwFyl40
Message-ID: <CADUfDZorK-i+eOEpGkVFf_vJhqLUKfBX9n_rkiWtbcyoMHT8uw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] tools: sync io_uring.h UAPI header
To: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, 
	Gabriel Krisman Bertazi <krisman@suse.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 2:16=E2=80=AFAM Aditya Prakash Srivastava
<aditya.ansh182@gmail.com> wrote:
>
> Sync tools/include/uapi/linux/io_uring.h with the main kernel
> include/uapi/linux/io_uring.h UAPI header to ensure they are
> perfectly aligned.
>
> Additionally, correct a minor space-before-tab checkpatch.pl warning
> in the comments of both headers (no functional change).
>
> Suggested-by: Gabriel Krisman Bertazi <krisman@suse.de>
> Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
> ---
>  include/uapi/linux/io_uring.h       |   2 +-
>  tools/include/uapi/linux/io_uring.h | 340 ++++++++++++++++++++++++++--
>  2 files changed, 325 insertions(+), 17 deletions(-)
>
> diff --git a/include/uapi/linux/io_uring.h b/include/uapi/linux/io_uring.=
h
> index 909fb7aea638..1f300f6b85d7 100644
> --- a/include/uapi/linux/io_uring.h
> +++ b/include/uapi/linux/io_uring.h
> @@ -426,7 +426,7 @@ enum io_uring_op {
>   * IORING_RECVSEND_BUNDLE      Used with IOSQE_BUFFER_SELECT. If set, se=
nd or
>   *                             recv will grab as many buffers from the b=
uffer
>   *                             group ID given and send them all. The com=
pletion
> - *                             result  will be the number of buffers sen=
d, with
> + *                             result  will be the number of buffers sen=
d, with

Can you drop the tab character and just use a space between the words?

Best,
Caleb

>   *                             the starting buffer ID in cqe->flags as p=
er
>   *                             usual for provided buffer usage. The buff=
ers
>   *                             will be contiguous from the starting buff=
er ID.
> diff --git a/tools/include/uapi/linux/io_uring.h b/tools/include/uapi/lin=
ux/io_uring.h
> index f1c16f817742..1f300f6b85d7 100644
> --- a/tools/include/uapi/linux/io_uring.h
> +++ b/tools/include/uapi/linux/io_uring.h
> @@ -10,6 +10,8 @@
>
>  #include <linux/fs.h>
>  #include <linux/types.h>
> +#include <linux/io_uring/zcrx.h>
> +
>  /*
>   * this file is shared with liburing and that has to autodetect
>   * if linux/time_types.h is available or not, it can
> @@ -50,7 +52,7 @@ struct io_uring_sqe {
>         };
>         __u32   len;            /* buffer size or number of iovecs */
>         union {
> -               __kernel_rwf_t  rw_flags;
> +               __u32           rw_flags;
>                 __u32           fsync_flags;
>                 __u16           poll_events;    /* compatibility */
>                 __u32           poll32_events;  /* word-reversed for BE *=
/
> @@ -71,6 +73,9 @@ struct io_uring_sqe {
>                 __u32           uring_cmd_flags;
>                 __u32           waitid_flags;
>                 __u32           futex_flags;
> +               __u32           install_fd_flags;
> +               __u32           nop_flags;
> +               __u32           pipe_flags;
>         };
>         __u64   user_data;      /* data to be passed back at completion t=
ime */
>         /* pack this to avoid bogus arm OABI complaints */
> @@ -85,17 +90,26 @@ struct io_uring_sqe {
>         union {
>                 __s32   splice_fd_in;
>                 __u32   file_index;
> +               __u32   zcrx_ifq_idx;
>                 __u32   optlen;
>                 struct {
>                         __u16   addr_len;
>                         __u16   __pad3[1];
>                 };
> +               struct {
> +                       __u8    write_stream;
> +                       __u8    __pad4[3];
> +               };
>         };
>         union {
>                 struct {
>                         __u64   addr3;
>                         __u64   __pad2[1];
>                 };
> +               struct {
> +                       __u64   attr_ptr; /* pointer to attribute informa=
tion */
> +                       __u64   attr_type_mask; /* bit mask of attributes=
 */
> +               };
>                 __u64   optval;
>                 /*
>                  * If the ring is initialized with IORING_SETUP_SQE128, t=
hen
> @@ -105,6 +119,18 @@ struct io_uring_sqe {
>         };
>  };
>
> +/* sqe->attr_type_mask flags */
> +#define IORING_RW_ATTR_FLAG_PI (1U << 0)
> +/* PI attribute information */
> +struct io_uring_attr_pi {
> +               __u16   flags;
> +               __u16   app_tag;
> +               __u32   len;
> +               __u64   addr;
> +               __u64   seed;
> +               __u64   rsvd;
> +};
> +
>  /*
>   * If sqe->file_index is set to this for opcodes that instantiate a new
>   * direct descriptor (like openat/openat2/accept), then io_uring will al=
locate
> @@ -114,7 +140,7 @@ struct io_uring_sqe {
>   */
>  #define IORING_FILE_INDEX_ALLOC                (~0U)
>
> -enum {
> +enum io_uring_sqe_flags_bit {
>         IOSQE_FIXED_FILE_BIT,
>         IOSQE_IO_DRAIN_BIT,
>         IOSQE_IO_LINK_BIT,
> @@ -164,7 +190,8 @@ enum {
>  /*
>   * If COOP_TASKRUN is set, get notified if task work is available for
>   * running and a kernel transition would be needed to run it. This sets
> - * IORING_SQ_TASKRUN in the sq ring flags. Not valid with COOP_TASKRUN.
> + * IORING_SQ_TASKRUN in the sq ring flags. Not valid without COOP_TASKRU=
N
> + * or DEFER_TASKRUN.
>   */
>  #define IORING_SETUP_TASKRUN_FLAG      (1U << 9)
>  #define IORING_SETUP_SQE128            (1U << 10) /* SQEs are 128 byte *=
/
> @@ -198,6 +225,33 @@ enum {
>   */
>  #define IORING_SETUP_NO_SQARRAY                (1U << 16)
>
> +/* Use hybrid poll in iopoll process */
> +#define IORING_SETUP_HYBRID_IOPOLL     (1U << 17)
> +
> +/*
> + * Allow both 16b and 32b CQEs. If a 32b CQE is posted, it will have
> + * IORING_CQE_F_32 set in cqe->flags.
> + */
> +#define IORING_SETUP_CQE_MIXED         (1U << 18)
> +
> +/*
> + * Allow both 64b and 128b SQEs. If a 128b SQE is posted, it will have
> + * a 128b opcode.
> + */
> +#define IORING_SETUP_SQE_MIXED         (1U << 19)
> +
> +/*
> + * When set, io_uring ignores SQ head and tail and fetches SQEs to submi=
t
> + * starting from index 0 instead from the index stored in the head point=
er.
> + * IOW, the user should place all SQE at the beginning of the SQ memory
> + * before issuing a submission syscall.
> + *
> + * It requires IORING_SETUP_NO_SQARRAY and is incompatible with
> + * IORING_SETUP_SQPOLL. The user must also never change the SQ head and =
tail
> + * values and keep it set to 0. Any other value is undefined behaviour.
> + */
> +#define IORING_SETUP_SQ_REWIND         (1U << 20)
> +
>  enum io_uring_op {
>         IORING_OP_NOP,
>         IORING_OP_READV,
> @@ -253,6 +307,17 @@ enum io_uring_op {
>         IORING_OP_FUTEX_WAIT,
>         IORING_OP_FUTEX_WAKE,
>         IORING_OP_FUTEX_WAITV,
> +       IORING_OP_FIXED_FD_INSTALL,
> +       IORING_OP_FTRUNCATE,
> +       IORING_OP_BIND,
> +       IORING_OP_LISTEN,
> +       IORING_OP_RECV_ZC,
> +       IORING_OP_EPOLL_WAIT,
> +       IORING_OP_READV_FIXED,
> +       IORING_OP_WRITEV_FIXED,
> +       IORING_OP_PIPE,
> +       IORING_OP_NOP128,
> +       IORING_OP_URING_CMD128,
>
>         /* this goes last, obviously */
>         IORING_OP_LAST,
> @@ -262,9 +327,13 @@ enum io_uring_op {
>   * sqe->uring_cmd_flags                top 8bits aren't available for us=
erspace
>   * IORING_URING_CMD_FIXED      use registered buffer; pass this flag
>   *                             along with setting sqe->buf_index.
> + * IORING_URING_CMD_MULTISHOT  must be used with buffer select, like oth=
er
> + *                             multishot commands. Not compatible with
> + *                             IORING_URING_CMD_FIXED, for now.
>   */
>  #define IORING_URING_CMD_FIXED (1U << 0)
> -#define IORING_URING_CMD_MASK  IORING_URING_CMD_FIXED
> +#define IORING_URING_CMD_MULTISHOT     (1U << 1)
> +#define IORING_URING_CMD_MASK  (IORING_URING_CMD_FIXED | IORING_URING_CM=
D_MULTISHOT)
>
>
>  /*
> @@ -274,6 +343,10 @@ enum io_uring_op {
>
>  /*
>   * sqe->timeout_flags
> + *
> + * IORING_TIMEOUT_IMMEDIATE_ARG:       If set, sqe->addr stores the time=
out
> + *                                     value in nanoseconds instead of
> + *                                     pointing to a timespec.
>   */
>  #define IORING_TIMEOUT_ABS             (1U << 0)
>  #define IORING_TIMEOUT_UPDATE          (1U << 1)
> @@ -282,6 +355,7 @@ enum io_uring_op {
>  #define IORING_LINK_TIMEOUT_UPDATE     (1U << 4)
>  #define IORING_TIMEOUT_ETIME_SUCCESS   (1U << 5)
>  #define IORING_TIMEOUT_MULTISHOT       (1U << 6)
> +#define IORING_TIMEOUT_IMMEDIATE_ARG   (1U << 7)
>  #define IORING_TIMEOUT_CLOCK_MASK      (IORING_TIMEOUT_BOOTTIME | IORING=
_TIMEOUT_REALTIME)
>  #define IORING_TIMEOUT_UPDATE_MASK     (IORING_TIMEOUT_UPDATE | IORING_L=
INK_TIMEOUT_UPDATE)
>  /*
> @@ -348,11 +422,24 @@ enum io_uring_op {
>   *                             0 is reported if zerocopy was actually po=
ssible.
>   *                             IORING_NOTIF_USAGE_ZC_COPIED if data was =
copied
>   *                             (at least partially).
> + *
> + * IORING_RECVSEND_BUNDLE      Used with IOSQE_BUFFER_SELECT. If set, se=
nd or
> + *                             recv will grab as many buffers from the b=
uffer
> + *                             group ID given and send them all. The com=
pletion
> + *                             result  will be the number of buffers sen=
d, with
> + *                             the starting buffer ID in cqe->flags as p=
er
> + *                             usual for provided buffer usage. The buff=
ers
> + *                             will be contiguous from the starting buff=
er ID.
> + *
> + * IORING_SEND_VECTORIZED      If set, SEND[_ZC] will take a pointer to =
a io_vec
> + *                             to allow vectorized send operations.
>   */
>  #define IORING_RECVSEND_POLL_FIRST     (1U << 0)
>  #define IORING_RECV_MULTISHOT          (1U << 1)
>  #define IORING_RECVSEND_FIXED_BUF      (1U << 2)
>  #define IORING_SEND_ZC_REPORT_USAGE    (1U << 3)
> +#define IORING_RECVSEND_BUNDLE         (1U << 4)
> +#define IORING_SEND_VECTORIZED         (1U << 5)
>
>  /*
>   * cqe.res for IORING_CQE_F_NOTIF if
> @@ -367,11 +454,13 @@ enum io_uring_op {
>   * accept flags stored in sqe->ioprio
>   */
>  #define IORING_ACCEPT_MULTISHOT        (1U << 0)
> +#define IORING_ACCEPT_DONTWAIT (1U << 1)
> +#define IORING_ACCEPT_POLL_FIRST       (1U << 2)
>
>  /*
>   * IORING_OP_MSG_RING command types, stored in sqe->addr
>   */
> -enum {
> +enum io_uring_msg_ring_flags {
>         IORING_MSG_DATA,        /* pass sqe->len as 'res' and off as user=
_data */
>         IORING_MSG_SEND_FD,     /* send a registered fd to another ring *=
/
>  };
> @@ -386,11 +475,30 @@ enum {
>  /* Pass through the flags from sqe->file_index to cqe->flags */
>  #define IORING_MSG_RING_FLAGS_PASS     (1U << 1)
>
> +/*
> + * IORING_OP_FIXED_FD_INSTALL flags (sqe->install_fd_flags)
> + *
> + * IORING_FIXED_FD_NO_CLOEXEC  Don't mark the fd as O_CLOEXEC
> + */
> +#define IORING_FIXED_FD_NO_CLOEXEC     (1U << 0)
> +
> +/*
> + * IORING_OP_NOP flags (sqe->nop_flags)
> + *
> + * IORING_NOP_INJECT_RESULT    Inject result from sqe->result
> + */
> +#define IORING_NOP_INJECT_RESULT       (1U << 0)
> +#define IORING_NOP_FILE                        (1U << 1)
> +#define IORING_NOP_FIXED_FILE          (1U << 2)
> +#define IORING_NOP_FIXED_BUFFER                (1U << 3)
> +#define IORING_NOP_TW                  (1U << 4)
> +#define IORING_NOP_CQE32               (1U << 5)
> +
>  /*
>   * IO completion data structure (Completion Queue Entry)
>   */
>  struct io_uring_cqe {
> -       __u64   user_data;      /* sqe->data submission passed back */
> +       __u64   user_data;      /* sqe->user_data value passed back */
>         __s32   res;            /* result code for this event */
>         __u32   flags;
>
> @@ -409,15 +517,33 @@ struct io_uring_cqe {
>   * IORING_CQE_F_SOCK_NONEMPTY  If set, more data to read after socket re=
cv
>   * IORING_CQE_F_NOTIF  Set for notification CQEs. Can be used to distinc=
t
>   *                     them from sends.
> + * IORING_CQE_F_BUF_MORE If set, the buffer ID set in the completion wil=
l get
> + *                     more completions. In other words, the buffer is b=
eing
> + *                     partially consumed, and will be used by the kerne=
l for
> + *                     more completions. This is only set for buffers us=
ed via
> + *                     the incremental buffer consumption, as provided b=
y
> + *                     a ring buffer setup with IOU_PBUF_RING_INC. For a=
ny
> + *                     other provided buffer type, all completions with =
a
> + *                     buffer passed back is automatically returned to t=
he
> + *                     application.
> + * IORING_CQE_F_SKIP   If set, then the application/liburing must ignore=
 this
> + *                     CQE. It's only purpose is to fill a gap in the ri=
ng,
> + *                     if a large CQE is attempted posted when the ring =
has
> + *                     just a single small CQE worth of space left befor=
e
> + *                     wrapping.
> + * IORING_CQE_F_32     If set, this is a 32b/big-cqe posting. Use with r=
ings
> + *                     setup in a mixed CQE mode, where both 16b and 32b
> + *                     CQEs may be posted to the CQ ring.
>   */
>  #define IORING_CQE_F_BUFFER            (1U << 0)
>  #define IORING_CQE_F_MORE              (1U << 1)
>  #define IORING_CQE_F_SOCK_NONEMPTY     (1U << 2)
>  #define IORING_CQE_F_NOTIF             (1U << 3)
> +#define IORING_CQE_F_BUF_MORE          (1U << 4)
> +#define IORING_CQE_F_SKIP              (1U << 5)
> +#define IORING_CQE_F_32                        (1U << 15)
>
> -enum {
> -       IORING_CQE_BUFFER_SHIFT         =3D 16,
> -};
> +#define IORING_CQE_BUFFER_SHIFT                16
>
>  /*
>   * Magic offsets for the application to mmap the data it needs
> @@ -478,6 +604,9 @@ struct io_cqring_offsets {
>  #define IORING_ENTER_SQ_WAIT           (1U << 2)
>  #define IORING_ENTER_EXT_ARG           (1U << 3)
>  #define IORING_ENTER_REGISTERED_RING   (1U << 4)
> +#define IORING_ENTER_ABS_TIMER         (1U << 5)
> +#define IORING_ENTER_EXT_ARG_REG       (1U << 6)
> +#define IORING_ENTER_NO_IOWAIT         (1U << 7)
>
>  /*
>   * Passed in for io_uring_setup(2). Copied back with updated info on suc=
cess
> @@ -512,11 +641,15 @@ struct io_uring_params {
>  #define IORING_FEAT_CQE_SKIP           (1U << 11)
>  #define IORING_FEAT_LINKED_FILE                (1U << 12)
>  #define IORING_FEAT_REG_REG_RING       (1U << 13)
> +#define IORING_FEAT_RECVSEND_BUNDLE    (1U << 14)
> +#define IORING_FEAT_MIN_TIMEOUT                (1U << 15)
> +#define IORING_FEAT_RW_ATTR            (1U << 16)
> +#define IORING_FEAT_NO_IOWAIT          (1U << 17)
>
>  /*
>   * io_uring_register(2) opcodes and arguments
>   */
> -enum {
> +enum io_uring_register_op {
>         IORING_REGISTER_BUFFERS                 =3D 0,
>         IORING_UNREGISTER_BUFFERS               =3D 1,
>         IORING_REGISTER_FILES                   =3D 2,
> @@ -558,6 +691,38 @@ enum {
>         /* register a range of fixed file slots for automatic slot alloca=
tion */
>         IORING_REGISTER_FILE_ALLOC_RANGE        =3D 25,
>
> +       /* return status information for a buffer group */
> +       IORING_REGISTER_PBUF_STATUS             =3D 26,
> +
> +       /* set/clear busy poll settings */
> +       IORING_REGISTER_NAPI                    =3D 27,
> +       IORING_UNREGISTER_NAPI                  =3D 28,
> +
> +       IORING_REGISTER_CLOCK                   =3D 29,
> +
> +       /* clone registered buffers from source ring to current ring */
> +       IORING_REGISTER_CLONE_BUFFERS           =3D 30,
> +
> +       /* send MSG_RING without having a ring */
> +       IORING_REGISTER_SEND_MSG_RING           =3D 31,
> +
> +       /* register a netdev hw rx queue for zerocopy */
> +       IORING_REGISTER_ZCRX_IFQ                =3D 32,
> +
> +       /* resize CQ ring */
> +       IORING_REGISTER_RESIZE_RINGS            =3D 33,
> +
> +       IORING_REGISTER_MEM_REGION              =3D 34,
> +
> +       /* query various aspects of io_uring, see linux/io_uring/query.h =
*/
> +       IORING_REGISTER_QUERY                   =3D 35,
> +
> +       /* auxiliary zcrx configuration, see enum zcrx_ctrl_op */
> +       IORING_REGISTER_ZCRX_CTRL               =3D 36,
> +
> +       /* register bpf filtering programs */
> +       IORING_REGISTER_BPF_FILTER              =3D 37,
> +
>         /* this goes last */
>         IORING_REGISTER_LAST,
>
> @@ -566,7 +731,7 @@ enum {
>  };
>
>  /* io-wq worker categories */
> -enum {
> +enum io_wq_type {
>         IO_WQ_BOUND,
>         IO_WQ_UNBOUND,
>  };
> @@ -578,6 +743,31 @@ struct io_uring_files_update {
>         __aligned_u64 /* __s32 * */ fds;
>  };
>
> +enum {
> +       /* initialise with user provided memory pointed by user_addr */
> +       IORING_MEM_REGION_TYPE_USER             =3D 1,
> +};
> +
> +struct io_uring_region_desc {
> +       __u64 user_addr;
> +       __u64 size;
> +       __u32 flags;
> +       __u32 id;
> +       __u64 mmap_offset;
> +       __u64 __resv[4];
> +};
> +
> +enum {
> +       /* expose the region as registered wait arguments */
> +       IORING_MEM_REGION_REG_WAIT_ARG          =3D 1,
> +};
> +
> +struct io_uring_mem_region_reg {
> +       __u64 region_uptr; /* struct io_uring_region_desc * */
> +       __u64 flags;
> +       __u64 __resv[2];
> +};
> +
>  /*
>   * Register a fully sparse file space, rather than pass in an array of a=
ll
>   * -1 file descriptors.
> @@ -638,6 +828,32 @@ struct io_uring_restriction {
>         __u32 resv2[3];
>  };
>
> +struct io_uring_task_restriction {
> +       __u16 flags;
> +       __u16 nr_res;
> +       __u32 resv[3];
> +       __DECLARE_FLEX_ARRAY(struct io_uring_restriction, restrictions);
> +};
> +
> +struct io_uring_clock_register {
> +       __u32   clockid;
> +       __u32   __resv[3];
> +};
> +
> +enum {
> +       IORING_REGISTER_SRC_REGISTERED  =3D (1U << 0),
> +       IORING_REGISTER_DST_REPLACE     =3D (1U << 1),
> +};
> +
> +struct io_uring_clone_buffers {
> +       __u32   src_fd;
> +       __u32   flags;
> +       __u32   src_off;
> +       __u32   dst_off;
> +       __u32   nr;
> +       __u32   pad[3];
> +};
> +
>  struct io_uring_buf {
>         __u64   addr;
>         __u32   len;
> @@ -670,9 +886,17 @@ struct io_uring_buf_ring {
>   *                     mmap(2) with the offset set as:
>   *                     IORING_OFF_PBUF_RING | (bgid << IORING_OFF_PBUF_S=
HIFT)
>   *                     to get a virtual mapping for the ring.
> + * IOU_PBUF_RING_INC:  If set, buffers consumed from this buffer ring ca=
n be
> + *                     consumed incrementally. Normally one (or more) bu=
ffers
> + *                     are fully consumed. With incremental consumptions=
, it's
> + *                     feasible to register big ranges of buffers, and e=
ach
> + *                     use of it will consume only as much as it needs. =
This
> + *                     requires that both the kernel and application kee=
p
> + *                     track of where the current read/recv index is at.
>   */
> -enum {
> +enum io_uring_register_pbuf_ring_flags {
>         IOU_PBUF_RING_MMAP      =3D 1,
> +       IOU_PBUF_RING_INC       =3D 2,
>  };
>
>  /* argument for IORING_(UN)REGISTER_PBUF_RING */
> @@ -681,13 +905,57 @@ struct io_uring_buf_reg {
>         __u32   ring_entries;
>         __u16   bgid;
>         __u16   flags;
> -       __u64   resv[3];
> +       __u32   min_left;
> +       __u32   resv[5];
> +};
> +
> +/* argument for IORING_REGISTER_PBUF_STATUS */
> +struct io_uring_buf_status {
> +       __u32   buf_group;      /* input */
> +       __u32   head;           /* output */
> +       __u32   resv[8];
> +};
> +
> +enum io_uring_napi_op {
> +       /* register/ungister backward compatible opcode */
> +       IO_URING_NAPI_REGISTER_OP =3D 0,
> +
> +       /* opcodes to update napi_list when static tracking is used */
> +       IO_URING_NAPI_STATIC_ADD_ID =3D 1,
> +       IO_URING_NAPI_STATIC_DEL_ID =3D 2
> +};
> +
> +enum io_uring_napi_tracking_strategy {
> +       /* value must be 0 for backward compatibility */
> +       IO_URING_NAPI_TRACKING_DYNAMIC =3D 0,
> +       IO_URING_NAPI_TRACKING_STATIC =3D 1,
> +       IO_URING_NAPI_TRACKING_INACTIVE =3D 255
> +};
> +
> +/* argument for IORING_(UN)REGISTER_NAPI */
> +struct io_uring_napi {
> +       __u32   busy_poll_to;
> +       __u8    prefer_busy_poll;
> +
> +       /* a io_uring_napi_op value */
> +       __u8    opcode;
> +       __u8    pad[2];
> +
> +       /*
> +        * for IO_URING_NAPI_REGISTER_OP, it is a
> +        * io_uring_napi_tracking_strategy value.
> +        *
> +        * for IO_URING_NAPI_STATIC_ADD_ID/IO_URING_NAPI_STATIC_DEL_ID
> +        * it is the napi id to add/del from napi_list.
> +        */
> +       __u32   op_param;
> +       __u32   resv;
>  };
>
>  /*
>   * io_uring_restriction->opcode values
>   */
> -enum {
> +enum io_uring_register_restriction_op {
>         /* Allow an io_uring_register(2) opcode */
>         IORING_RESTRICTION_REGISTER_OP          =3D 0,
>
> @@ -703,10 +971,33 @@ enum {
>         IORING_RESTRICTION_LAST
>  };
>
> +enum {
> +       IORING_REG_WAIT_TS              =3D (1U << 0),
> +};
> +
> +/*
> + * Argument for io_uring_enter(2) with
> + * IORING_GETEVENTS | IORING_ENTER_EXT_ARG_REG set, where the actual arg=
ument
> + * is an index into a previously registered fixed wait region described =
by
> + * the below structure.
> + */
> +struct io_uring_reg_wait {
> +       struct __kernel_timespec        ts;
> +       __u32                           min_wait_usec;
> +       __u32                           flags;
> +       __u64                           sigmask;
> +       __u32                           sigmask_sz;
> +       __u32                           pad[3];
> +       __u64                           pad2[2];
> +};
> +
> +/*
> + * Argument for io_uring_enter(2) with IORING_GETEVENTS | IORING_ENTER_E=
XT_ARG
> + */
>  struct io_uring_getevents_arg {
>         __u64   sigmask;
>         __u32   sigmask_sz;
> -       __u32   pad;
> +       __u32   min_wait_usec;
>         __u64   ts;
>  };
>
> @@ -743,11 +1034,28 @@ struct io_uring_recvmsg_out {
>  /*
>   * Argument for IORING_OP_URING_CMD when file is a socket
>   */
> -enum {
> +enum io_uring_socket_op {
>         SOCKET_URING_OP_SIOCINQ         =3D 0,
>         SOCKET_URING_OP_SIOCOUTQ,
>         SOCKET_URING_OP_GETSOCKOPT,
>         SOCKET_URING_OP_SETSOCKOPT,
> +       SOCKET_URING_OP_TX_TIMESTAMP,
> +       SOCKET_URING_OP_GETSOCKNAME,
> +};
> +
> +/*
> + * SOCKET_URING_OP_TX_TIMESTAMP definitions
> + */
> +
> +#define IORING_TIMESTAMP_HW_SHIFT      16
> +/* The cqe->flags bit from which the timestamp type is stored */
> +#define IORING_TIMESTAMP_TYPE_SHIFT    (IORING_TIMESTAMP_HW_SHIFT + 1)
> +/* The cqe->flags flag signifying whether it's a hardware timestamp */
> +#define IORING_CQE_F_TSTAMP_HW         ((__u32)1 << IORING_TIMESTAMP_HW_=
SHIFT)
> +
> +struct io_timespec {
> +       __u64           tv_sec;
> +       __u64           tv_nsec;
>  };
>
>  #ifdef __cplusplus
> --
> 2.47.3
>
>
