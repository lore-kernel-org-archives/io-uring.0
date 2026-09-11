Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B5747424E
	for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141079; cv=pass; b=bc+WCJyuSLUB2xoJ/sefSlAKKgAy/R3zPYzzx4Ch0JLNdBl1Xvj2rPCVBkRB0Ex9pb4L8GlED5cxMVBN4ds7wBQc8qU3tvfEA1AowwFG37wEbmIGKZ98241a/lKcjyZdfndBBIYi5347SbvG0W5nyxGXGZZ8jlfuNdSXg+yOGKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141079; c=relaxed/simple;
	bh=+PvUBu05+2YMlPHjfbtJA5IagWMaCmpnP8h1CMs7p6s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ut0YsKbiW/o4A/kVOn3GOvhsIOiXQvjxV3DgXPM1Bu1FlCz88MI+OtxZ/5gnzAMyDTrNxMw/huWTobFiPMAoJxfTa/O3OVoVdtnoh/Tj0Q0fam/7RSl4jnFI6WlPTo5I8nL32y0pcZa/CWmOzGiIAsgDFwGhUpw8vdfYHd6U62c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lSZxiYcv; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lSZxiYcv"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db425c9050so9295ad.0
        for <io-uring@vger.kernel.org>; Fri, 11 Sep 2026 08:37:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141077; cv=none;
        d=google.com; s=arc-20260327;
        b=jPCfJVugWylctlBIXgbwBz6F0jEj0DUV8e/wKs1SDG3YRJCxRQHbSm9V+StnYEGYLg
         A2fneHpAqvy2x53Q8cip/sAokmozGme8orSb+/XM581zSsacHMjoR19AV0Po5qPNRENx
         jU33v2uOo4rQFARNdcc0BevPkDxjVSDvk+DHHIpkKE9Zk8qfjCk+1kgWOzVBMUZFDOmc
         o9+xNZu4f06kdFusNFG5O7Hf5GAbZn7pc25oWO/xNIHOu7BL5JSZUlLR4WcjhpX6kWTs
         /UtFYbxbntnfwhg9QzbKl7r6ip0sqG6ZgBAuPsv3Mu+mMvc4mtlDwp51BO+AusDzJR/x
         5KlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        fh=0te7uWtwjsVdt0tSXR+mMC6RGEbBsUqpgZJHp+y6JBk=;
        b=UKKd/0nMUlD66nHAcBgQJZcjcnxj9wcw9k5CUeHYSLubjyKKU6zf9vNHsq00O4HyXh
         888GXWE55xdL78JQjLyUaLo7xH4ZUy8s2csTZbD0jmP/eWNMW4xMxgEnOgqQcJSSy5Sl
         Pnc6DYUAdP659fMf0WvL229oAe3ZpMJFkgDaadHXHXtkN6bJpuLXHzgKjENLI7YYPxUw
         hFAWDs8H48AfpACZmQhm4uoGXfSu9ZG+RaNwxxfomZoj4piZ8c5p7a9UTttUX1b5z/H4
         oCixka9LO/1Nk5wEr9fUYPulc/5RcTmoa9+6bDlwGmFECX1Q2ZWdyLLo4xoOQFeg6XTX
         vZFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789141077; x=1789745877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        b=lSZxiYcvvyDtF/F2rQuM0CjVXppnIiGxUJJb5oV8qd3/SV3eD1Y5dfieXbLD4deZ/g
         sQYDusdxdGglq6wPwyHBr01bQiB3Uey6mrcyhCDqHcoZ8IbclOFiHVMS7qwAvSRRi9Go
         tpiEVSPEuVuHVK+l1uFMLyTwwF4bflvuN9I2qspbu3zniFmwnCsjhaNCSAtR7HOR4wjZ
         PZGR4ttH9ofK8e+RzWYKU5Favf3KToVby3zY/sRXtZUtaAlzZpf0poJ6+5YJvrfglArU
         xuMSS8GJcTaJ62mD2CwrJN0h2qafV7/lzquULPFaigXQn9XJGzB3cYOGriYMTt0GgS/2
         lKgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141077; x=1789745877;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wsCIxhtGq5P1DGf/JLu9tT2TciWG+UAgFAPkzel97sQ=;
        b=sZdANF9gF+o+tevP0d4S1besc1i1yNa3erqIGIFBGe0UzC5Rd9DzG+LtRuHzhlX70U
         BHie2WXWKLr2oKd/pa2waZSVENZFCT45lZ7kAdN5YNx/gWox7wHiufgzUgv2QuAUXrPq
         HbQQukxYKPQ0ejVCr1m48KnSVMU2RmziHSAeQsNFnfIGuX5dTbBadrjOkyduMje2GDmO
         2nPPjDXos+Z3pchxjJ1C8AtJl6/scbbXB2rSfXwsPq5M5KyIlrQZAxy9esbkWWCq/yzw
         VILVaXEXjBJUHIANVlFR0oa3L9IoEQ4LquATOfInmtQz+8OtUWmsVr5nOoRHY+yNO4Yq
         TGCg==
X-Gm-Message-State: AFuF++mT7YRFwEsyzZHCiCGDMTx9jJGBIc0QppRx2LDyjel6SyYAQ3zF
	Fi03hph3B6v/nousGlhRlvSn6Wcgk++5myCoiNVzNNsYC27WYxXu+l6YxdhILfQjlZJ+dYafdiy
	K7csUr1DI/eJqTiDQi2QdzV0QxPWPEvxcKMRloPpe
X-Gm-Gg: AYBFou1Ik8fI9wCXMXKoDYWqzt6TshV2ZBf89aX+2O9V9KykXj7P6t4Uf2ovH2jtFjw
	+/T0h2jMCzvl1ciCOWswFwg4kySamBjK6sO2ZjdH8OJFT07xeaK541jTmi4DElI9RElI0c63eyz
	5cdeuPF5rnbZDXxKgXiLg4Ck5vtKthF0rWlToXHgGFMBts8qYguqXW1s8yw5y1RRlCjpFmQ4fBZ
	v6v02kOalgnPvm+n4CDocDikLnBlk6UqxH/REDQ/Z6lz4OmjF48C/t7UxyVmEOrApb71/Uyh+zB
	6h/ax6EBdA7ZRKhuN6lp/qeZhicPrWm/tORMhCFrbEGhJ0i8FyZC353STOC96GR/M1aiqrY6ZJ0
	TBG5aBjxrP86Otd9i5JAZKV7g8E3IeOhHhoSWO3FEp/OCWTU3Uq9k
X-Received: by 2002:a17:903:2450:b0:2d5:db3d:1a43 with SMTP id
 d9443c01a7336-2dd2ccad1dbmr7425785ad.16.1789141076474; Fri, 11 Sep 2026
 08:37:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
In-Reply-To: <20260911-uring-fdinfo-tighten-v1-1-47c62a154aca@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 11 Sep 2026 17:37:19 +0200
X-Gm-Features: AcwNN1VKgf4fw_Ks11JTx3jlILU5s45x6YRkDDYmuZ_v7ulwv1aK31yKugsCtS8
Message-ID: <CAG48ez3vVAnqjmzDxQZnkhHkw4yyHFzKwNT-2N7veG-mmpfMXw@mail.gmail.com>
Subject: Re: [PATCH] io_uring/fdinfo: ignore IORING_CQE_F_32 in last CQ array slot
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Dominik Maier <dmnk+artist@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 5:35=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> A cqe32 entry spans two CQ array slots, so the last CQ array slot can't
> contain a cqe32 entry. If the CQ tail points at the last CQ array slot an=
d
> the kernel wants to write a cqe32 entry, it uses io_fill_nop_cqe() to pad
> the last CQ array slot with a dummy entry and make the tail wrap around.
>
> However, malicious userspace can directly set IORING_CQE_F_32 on the last
> CQ array slot, causing __io_uring_show_fdinfo() to read the second cqe32
> half from beyond the CQ array. Change __io_uring_show_fdinfo() to
> explicitly ignore the IORING_CQE_F_32 flag in this case.

Here is the testcase I used to experiment with this:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <linux/io_uring.h>

int main(void) {
  const int cq_entries =3D 16;
  struct io_uring_params params =3D {
    .cq_entries =3D cq_entries,
    .flags =3D IORING_SETUP_NO_SQARRAY|IORING_SETUP_CQSIZE
  };
  int uring_fd =3D syscall(__NR_io_uring_setup, /*entries=3D*/1, &params);
  char *mmap_region =3D mmap(NULL, 0x1000, PROT_READ|PROT_WRITE,
MAP_SHARED, uring_fd, IORING_OFF_SQ_RING);

  *(unsigned int *)(mmap_region + params.cq_off.tail) =3D cq_entries;
  struct io_uring_cqe *cqes =3D (struct io_uring_cqe *)(mmap_region +
params.cq_off.cqes);
  for (int i=3D1; i<cq_entries; i+=3D2)
    cqes[i].flags =3D IORING_CQE_F_32;

  char cmd[1000];
  sprintf(cmd, "cat /proc/$PPID/fdinfo/%d", uring_fd);
  system(cmd);
}


With the fix applied, it prints the CQEs as follows (note that the
last line has flags 0x8000 but no extra1/extra2):

    0: user_data:0, res:0, flags:0
    1: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    3: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    5: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    7: user_data:0, res:0, flags:8000, extra1:0, extra2:0
    9: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   11: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   13: user_data:0, res:0, flags:8000, extra1:0, extra2:0
   15: user_data:0, res:0, flags:8000
