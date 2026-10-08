Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9013BFE4C
	for <io-uring@vger.kernel.org>; Thu,  8 Oct 2026 23:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791501667; cv=pass; b=R3EFjlh3cwRUfk9gA7RuwrgNE0/TKImqbkjiyee5Ms0m4y0yKbJaczSzVlnUCKBUNcdJwS98CZpwb6ITDsma43y01VWWu0r3CzttJ5jibzE73pYKTRM3J0pWM4cltg31nV/rOCuIjHRoTGcUpKUPDbAjfidnVvB0ZJX/3h5XoMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791501667; c=relaxed/simple;
	bh=iOPXpz2hYSa7f/K56PPGBIt0889qKAPqpOv97irhDwA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZgFiaRIMIeWFqKWKre1t+WIzrGucIwg1SSCTuecotxbxL0/KJZkZFE3tJuOvpN5+Z3QeFlAqoErSGk+X+RtRnj3FHMOFwQFY4shc+9eHAekijuQUHM3FztssKMWJtoxGX2nJVdsMjsgr/FxsyrzxbxqcubGkl1eXcSpB4fjkDjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g1x+39aa; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g1x+39aa"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8258ac98bc2so4568371a34.3
        for <io-uring@vger.kernel.org>; Thu, 08 Oct 2026 16:21:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791501665; cv=none;
        d=google.com; s=arc-20260327;
        b=Gthff/nrAfLBISgaxNKo8sV3kvMLx/go4/NZs9cPn2S/3JedoV+1hpzTRmoUedZc9O
         6AkTgQ9Dt5K7beKNTBoyq2i3cIUjy9JFoVysSrnPLUkkYOG5U6xVyVNYUGNPMA3XtRm3
         WBjomWaaDE+9bnjnY2VmFEtYKqljoTEpS7Ai1NY+kU5dUo3l2MevrbTmSNegE6Gad5eR
         DDKLqhHtmSZETXvKWHDSNZnpqz0Oz2ZnFUDnzUFAjqtCl0t8Csb6E/vq7yYlQkd7+tRJ
         goM5DHUcnlcpaXD0FZ6r2+lxUNCsxEuRtzPtFbdn70eJqtUZs5OzXPEa5L5YS4uoI7km
         7K6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=CYDh8h0Kh5ZwMO1xcMsV77KQODdkBTwWicEx9ndsYd0=;
        fh=WR+hP0CuMafQvKPT06McXrBFnHzj5eybKzLq1YqhV68=;
        b=QgBl6euRyJWNnkMlNGR2JfITjnIzvtKvrIFq8+OAfwAl20ygJgG0aGjd8hf+TomnAn
         Swb+eIQKGiy47MWXDpUEPy0uhHLaKyQ6OxytnbNAPcycFPDzDcw7QmnxDs1XZrlcmIdr
         elOBJ5IK1bwvPC7na3T7edP0A8PeiJLGeTm4JAboaA0Lqp/Vc+T9M+lTaO5i+W6wfCwk
         LtVGoj3y+KoXiAtBLi/aA7rs1n4OvJHbywCyNaG58OseRpFVObXl3oRqoM+eLYWM7cZy
         Sdi2M+UYGchK6SWDKYLCnRb+en2SZ8jcGyMLY6eNMIOu8irOmBEbd9bvpVfLRI+qgRMj
         RwyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791501665; x=1792106465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CYDh8h0Kh5ZwMO1xcMsV77KQODdkBTwWicEx9ndsYd0=;
        b=g1x+39aaipH/4zgn1F4anxnDe25tYdGreQlzshvMWID2BmqcxygmIkGlPCd1o/8Ddv
         8wwt+OgA6OmRQunp9dOik9uox/CBRXgNa/GMGyf4ngXfnKrugO7qTQeWV10ndoRgJJuD
         zRI3Nrj903Eubo+Vx1RK1ej9H+H1zRngIW4y6Y2H81qcatfyRTOqX/WM98FRP1rRnP7e
         RyTtqVDrB89pCvOscZRzGnCKSD7uNwR7tSspVtAjSGO5tDL9mURxYngwTHL0pCxNbhP1
         DzgsA8jo04yx/0msV3GMpTpSl6bGCRZMaZkMllAB3t8aNERk6neu5fKhrOLOf2BzydrG
         PTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791501665; x=1792106465;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CYDh8h0Kh5ZwMO1xcMsV77KQODdkBTwWicEx9ndsYd0=;
        b=C9CNudsIMkswEIGLXrTtWO0PSENBAw1qWEZCcsd7UPJK1PhwLgkxvey4oB98W10Aew
         HWmelAQfuklhSUaeQXFXJw5PhVaxFUAinaxtRIFnI45m6YU7aMIqYjhqN4yUk8HxyrTL
         exGLeBvzhcs5UamWiuexuPjEKAPLxCRc7PMMBgrMAKQZifCCQ70VvoEWAyVOmb52vj9S
         2SYh+SqGPTIm70BFYo+oUNd1HckBLdTEL3XjQ8/+JiE9RHdeIrWmCidO2wyNVgH9fwg+
         tTxP4WB6fbYPvO7zY4ZIXGJR0aOx9F+KWCKbbBKmYiHRnSzu3RihwzvbsndSZUK/LtFb
         avQg==
X-Gm-Message-State: AFuF++mCYOHYiQg71AOTZiSdqYVJ8ISTXugVtLsZR+E901478N6YIwlP
	RRBAVGB5VC7d/nuH1fK4lEYZVz0Nhrdowhax1CYhVYbmBRPUYyCM/JmXXX5h3qEfAQB7+QUjFzy
	Ymnvs2gf+11PUj9i1FEgxORU9t7g39AE8U/5n
X-Gm-Gg: AYBFou2Yic9sLSxtqUDmt5lSj491F2eo4L2lFMdy7FwP335fdlauNvOg/1LpW3y9HMZ
	Fii1oW6lYy1Xyis61M4YBiges0iCquSRMpILP2tELYfonu7ZKvxj6KNdhyYu5/4f66TdQy0tcFH
	He8IOzvFgW9xV8D0y23hNbByfB36ZDoOBtdGWntyhS0mxeVmmz/gqoTjoYFwSLldwC4XO6k+JNm
	OE/mJFG7M1aozmuXYGfSwT3g8GXQP6OMKSSHHUPPoApqSVfwtM3GM5TTzD1LSbOTvd/pe1hiaUa
	Jb3OWX2X8ilJYadLbKfFYNLK1Uk9NC5b9dPi2hQ6H6wSAFaoOtozivUs
X-Received: by 2002:a05:6830:67d6:b0:81a:aa47:3d5b with SMTP id
 46e09a7af769-82ad00b299bmr7823152a34.28.1791501665135; Thu, 08 Oct 2026
 16:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Eugene Gvozdetsky <gvozdet@gmail.com>
Date: Fri, 9 Oct 2026 01:20:55 +0200
X-Gm-Features: AclHuK8M3xCjtFcMn7RAHVuzkkomCCsk-2Yqd7b6t-o0ORGbVaUlk3UTmg8eljM
Message-ID: <CADx8=FLXawk5eeEUTUiMKKYh_61QaQ3V1CeEfYJ1xv+pwze3AQ@mail.gmail.com>
Subject: Using task-level io_uring restrictions in container runtimes
To: io-uring@vger.kernel.org
Cc: axboe@kernel.dk, brauner@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm prototyping support for the 7.0 task-level io_uring restrictions in
an OCI container runtime (youki), and proposing a matching field for the
OCI runtime spec:

  https://github.com/opencontainers/runtime-spec/issues/1323

The runtime applies a policy built only from cBPF filters (an allow
filter per permitted opcode, then IO_URING_BPF_FILTER_DENY_REST, plus a
socket family filter) in the container's init, before seccomp and before
capabilities are dropped. I avoided IORING_REGISTER_RESTRICTIONS for the
runtime policy: it also denies SQE flags that aren't listed, and it can
be registered only once per task, so the workload couldn't restrict
itself further. BPF filters stack.

Two questions before I take this further:

1. Is BPF-only the intended way for a container runtime to use this, or
   would you rather see the opcode allowlist used for the outer policy?

2. On 7.0, restrictions are dropped on exec once the task has used
   io_uring (fixed by bc0e8faf90e7, tagged for 7.1+). Ubuntu 26.04
   carries the fix since 7.0.0-39. For runtimes this means a version
   check is not enough to know the policy holds. Is a runtime self-test
   (restrict, use a ring, exec, check) reasonable, or is there a better
   way to detect a kernel with the fix?

I also wrote a liburing test for the exec case (fails on 7.0, passes on
7.2.9), which I'll send as a PR.

While testing I also found that task register restrictions are skipped
on rings created with IORING_SETUP_R_DISABLED; the fix is here:

  https://lore.kernel.org/r/20261009-iouring-task-restrict-fix-v1-1-a49daf55a12c@gmail.com

Test notes and scenarios: https://github.com/gvozdetsky/iouring-lab

Thanks,
Eugene
