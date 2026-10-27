Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793068886;
	b=t9+u2JhvbDp7fhBrXMAuXpYD0kOsv3F+yfy8tpoPFrD1KggclpYkkVYNjFlR/J7IAgt5
	 X9R7Ul1f+kqj4ZtRPdKPoYLBjbWUcTKlUkbISUlAqI1FPExZKl1bNQal1Wdndc9M3z6c0
	 JfAJARR8cki3k1Knn9RmflmXUe5kaCYQ7NIivsC0YccZgMtiLl70yixwC9bMJAa9qsDvD
	 r2J3CTfffBCH6p5MEP/fuscQLJeIWbb5UHbObQN7Wk2MANcGZqBiUvC6OqDDb/TozSY0M
	 Auf1Vrwoo+x6LkRbOSTXXSnLDR7PhB5GDXcWbTgVGkzdQhAE4Kq1t2AKqE1iO16QYBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793068886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
	b=od3wbddlsygjs6xoQogtqLslwFbq4pSn6h0cw/ydov29aDeGuJmYJZTRSiv5bzKweqL4
	 spfEMpWegbdq1a4XVRux9MnmNnyBb0aEDdn9WEC45PFYW/AH28NvEAA0yPL2frFftI6Wm
	 6NYTDlUrzdT0lyaBtIfDCKI7U9qQ/+JBhQ4ZYlzzQ83/tdkgqq/wQncSZwgLt4s+k1Sok
	 NyjlZwsqZ8AtLSjWo2XzBFn6d2aBr8J8zqaWjU59ygkwnKu/Wu6TcCr71CZY+B72dP9yu
	 XLM7sFPnsXsOsOKSAYS8c7VRtAzxEQzP+IWMFxAol8fxlMzR7+dug0jThMB0abI59QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9F5606A31D
	for <io-uring@vger.kernel.org>; Tue, 27 Oct 2026 02:41:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B9F5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3125908c88.0
        for <io-uring@vger.kernel.org>; Mon, 26 Oct 2026 19:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793068884; x=1793673684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=oc6cZqFau/HqROtNMBTq8ZP3TLLLzMKPOdbVxFYEww/DOpOMHzAfKhTORNvN4KTBkp
         LUp5Moi9eFCEYu5/4XDZT8WcjpiPsCN+0zUGPUekQp2yZJY0zBe8yl4kYAkKqjEdTrbQ
         qqNSykJeEwW7qBFZEoQS1rQ+7ZwY381+e8TxKyiv+Q5rLJiCFF4PtyVkTxWHTKQMc6vO
         +lb3qFo71UgGSSnv6IseZ7y8wLhEFz6jBXh4HUpywe8jgXN4FoqKQy7CyAzCO9Yfeytz
         HBIYtHcP3MQ7eijYy79F5eSeZqsN4/+XnIDB6Cna6QVY5R0NQaf50jlOwAuklcgL/mVV
         dVQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793068884; x=1793673684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/+f5haOvY7V5aJLRvqMe+OKgyMJap2D1kg9AHRnXBFo=;
        b=Fqw6DGzDiU7DunAl1iNrB5HoHiAmErLhdR2dbWSBTXp+xjjBFHBepwnTn+P7jzgjBr
         RMgv2qSVVsqgWGjf6aylKhxU1hxYsv5NrwRIL/TfN7mjXCTEPJtTUC3OYDHr4AmuOUn7
         IWOX7vuXuFCD6a0QqJ4WH6d5IUnPkLFpjsbaThZkSNbzcQFLjFfqIikjQ2Y7LLhjaFgY
         QWp+psNdbWqquQGnkzP2dQUjC7wi560TupwxlJHl4Rc73ga6iNa3L1o88+Fve9Mpj1JG
         DiQ4g0hVMNffZkwJ1ngQTCSvCStV4KNtUNCX6BiSeA5ToKclFXNVqEZ/wlpXFXarV4j7
         OMQw==
X-Forwarded-Encrypted: i=1; AKwUvBzRNU8wnFfu0MxzKaSEbMmiUz54NwKubvsP1YugSWa0edgY/bNyQSxGUW1IpwdwsuXfQPT1oH5Wwg==@vger.kernel.org
X-Gm-Message-State: AFq9FYITgHM7xcKL2XrYpZPDcPgUukiHVfQycxifPLH9UN8C1ZtDCpkr
	FaApks7xhr6eT91T47pIzKHEw8OP2qpjP0QYhFroSn/k4iec3zDRbHMYN1YVO4UA9FQ=
X-Gm-Gg: AYBFou3gZBYY8wMKloXtr9NqsDUN2OPZ8gEzBX3YIcYhZLOg3OuqCpyB7E1Pg8Vrv2E
	1Zy0vLUnAOvRHAGB+aZlrKlh4+gEmAPKDTH/+kQg8fXGsdh8k2/2KD+5TE8gOuDSK++4eyJRAO8
	mchPl4ZpUQ44kP875Z0kOpuVNeC5tIBKW5QX4Kpm3ncRj+YbPkiw93mLlipDFE4s0dKO5JcPsuZ
	DRT5Bmd5Kmguu7+eHt3oT5X+JRFB5fdh+5boysJt++gUiFW6mou9UyKedjGOm7ZnrkCEpFbeF94
	6PwMQCSXTiqLcQcyiK4YXBUhI4t87JYvax8BdCWcDWrV8EXFzbNGwVP7c4YP4O+gsInWk+PHrmk
	s/F51u6KrZDdglpRjGS8IKN16PaowsndVO+t0NWNfETsS+GlTkvsOimc+BEPSc4juPld69xHj3m
	HzdemdyvY5wCPCIvQZXkymrCh7K07ndpUfjYbkfUcmJu42jxSxeVqW6yUEsFlt7DAqSKT2I9Qra
	M0jJ6xYC7mQVzendH0ysUVnskX/izmU19EhwI/hVNnkoOHeDVcLmLTV7TN/B9euBQ2e3Z0kL7r1
	U+KU+8gnnwkyCkXyb71hHf6kWW7FA7Hc1Sn+USU=
X-Received: by 2002:a05:701b:4184:20b0:191:444:425 with SMTP id a92af1059eb24-199290fe40cmr12440066c88.2.1793068884148;
        Mon, 26 Oct 2026 19:41:24 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a1bfaf25sm29293759c88.14.2026.10.26.19.41.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 19:41:23 -0700 (PDT)
Message-ID: <1ee97e9e-3658-41a7-a879-348f51ab547d@kernel.dk>
Date: Mon, 26 Oct 2026 20:41:21 -0600
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Post: <mailto:io-uring@vger.kernel.org>
List-Help: <mailto:io-uring+help@vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
List-Owner: <mailto:io-uring+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/10] scsi: bsg: Don't copy sense data to user memory
 when canceled
To: James Houghton <jthoughton@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Sean Christopherson <seanjc@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>,
 Pavel Begunkov <asml.silence@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
 io-uring@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-btrfs@vger.kernel.org, bpf@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-2-jthoughton@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261026215226.3713941-2-jthoughton@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Reviewed-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe

